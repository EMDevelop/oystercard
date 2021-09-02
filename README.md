## OYSTERCARD challenge domain model

```
Install Gemfile

## OYSTERCARD challenge domain model

Nouns / classes: 
*  Card (has a limit and a minimum amount)
*  Money 
*  Fare
*  Journey
*  Station

Verbs / methods:
*  balance 
*  add(money)
*  deduct(fare) / pay_for(journey) / fare_correct?
*  touch_in(card) / penalty_charge
*  touch_out(card) / penalty_charge
*  view_start_of_journey
*  view_all_journeys
*  view_zone_of_station



## OYSTERCARD challenge user stories
```
In order to use public transport
As a customer
I want money on my card

In order to keep using public transport
As a customer
I want to add money to my card

In order to protect my money
As a customer
I don't want to put too much money on my card

In order to pay for my journey
As a customer
I need my fare deducted from my card

In order to get through the barriers
As a customer
I need to touch in and out

In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey

In order to pay for my journey
As a customer
I need to pay for my journey when it's complete

In order to pay for my journey
As a customer
I need to know where I've travelled from

In order to know where I have been
As a customer
I want to see to all my previous trips

In order to know how far I have travelled
As a customer
I want to know what zone a station is in

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

In order to be charged the correct amount
As a customer
I need to have the correct fare calculated