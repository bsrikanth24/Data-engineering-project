import pandas as pd

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
    
    # format column names
    df.rename(columns={'Date':'order_datetime'}, inplace=True)
    df.columns = df.columns.str.lower().str.replace(' ', '_')

    # convert order_date to datetime
    # df['order_datetime'] = pd.to_datetime(df['order_datetime'], dayfirst=True)
    # df['order_dt'] = df['order_date'].dt.date

    # add order day, month and year columns 
    df['order_day_of_week'] = df['order_datetime'].dt.day_name()
    df['order_month'] = df['order_datetime'].dt.month_name()
    df['order_year'] = df['order_datetime'].dt.year

    return df


@test
def test_output(output, *args) -> None:
    """
    Template code for testing the output of the block.
    """
    assert output is not None, 'The output is undefined'
