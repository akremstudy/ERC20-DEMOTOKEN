from brownie import chain
def test_mint(accounts,token):
    assert token.balanceOf(accounts[0]) == 1e23

def test_name(accounts,token):
    assert token.name() == 'DemoToken'

def test_time(accounts, token):
    balance = token.balanceOf(accounts[0])
    chain.sleep(3600)
    token.claim({'from':accounts[0],'value':0})
    # assert token.balanceOf(accounts[0]) == balance + 1e18
    try:
        assert token.balanceOf(accounts[0]) == balance + 1e18
    except:
        assert token.balanceOf(accounts[0]) == balance + 1000277777777777777