import pandas as pd
import re

if 'transformer' not in globals():
    from mage_ai.data_preparation.decorators import transformer
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@transformer
def transform(df, *args, **kwargs):
    """
    Template code for a transformer block.

    Add more parameters to this function if this block has multiple parent blocks.
    There should be one parameter for each output variable from each parent block.

    Args:
        data: The output from the upstream parent block
        args: The output from any additional upstream blocks (if applicable)

    Returns:
        Anything (e.g. data frame, dictionary, array, int, str, etc.)
    """
    # format and rename columns
    df.rename(columns={
        'Date':'order_date', 
        'Date of Meal':'meal_date', 
        'Type of Meal':'meal_type', 
        'Participants':'customers'
        }, inplace=True)

    df.columns = df.columns.str.lower().str.replace(' ', '_')

    # convert order_date & date_of_meal to datetime
    df['order_datetime'] = pd.to_datetime(df['order_date'], dayfirst=True)
    df['meal_datetime'] = pd.to_datetime(df['meal_date'], format='%Y-%m-%d %H:%M:%S%z')


    # add order day, month and year columns 
    df['order_day_of_week'] = df['order_datetime'].dt.day_name()
    df['order_month'] = df['order_datetime'].dt.month_name()
    df['order_year'] = df['order_datetime'].dt.year

    # TODO: add meal day, month and year columns 
    # df['meal_day_of_week'] = df['meal_datetime'].dt.day_name()
    # df['meal_month'] = df['meal_datetime'].dt.month_name()
    # df['meal_year'] = df['meal_datetime'].dt.year


    # Function to extract customer names using regex
    def extract_names(row):
        names = re.findall(r"'([^']*)'", row)
        return names

    # convert values in customers column to a list
    df['customers'] = df['customers'].apply(extract_names)

    # get number of customers for each meal 
    df['num_of_customers'] = df['customers'].apply(lambda x: len(x))


    return df

@test
def test_output(output, *args) -> None:
    """
    Template code for testing the output of the block.
    """
    assert output is not None, 'The output is undefined'
