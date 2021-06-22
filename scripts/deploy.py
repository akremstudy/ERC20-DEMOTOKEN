#!/usr/bin/python3
from brownie import DemoToken, accounts

def main():
    return DemoToken.deploy({'from': accounts[0]})