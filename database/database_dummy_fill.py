"""Simple script to create dummy data for flight database"""

import random
from datetime import datetime
from datetime import timedelta
from random import randrange

import pandas as pd

# Airports and their locations
AIRPORTS = {'ATL': {"City": "Atlanta", "Zip": 1000, "State": "Georgia", "Country": "USA"},
            'ORD': {"City": "Chicago", "Zip": 1001, "State": "Illinois", "Country": "USA"},
            'DFW': {"City": "Dallas", "Zip": 1002, "State": "Texas", "Country": "USA"},
            'JFK': {"City": "New York", "Zip": 1003, "State": "New York", "Country": "USA"},
            'LAX': {"City": "Los Angeles", "Zip": 1004, "State": "California", "Country": "USA"},
            'SFO': {"City": "San Francisco", "Zip": 1005, "State": "California", "Country": "USA"},
            'CLT': {"City": "Charlotte", "Zip": 1006, "State": "North Carolina", "Country": "USA"},
            'MIA': {"City": "Miami", "Zip": 1007, "State": "Florida", "Country": "USA"},
            'AUK': {"City": "Auckland", "Zip": 2013, "State": "Auckland", "Country": "New Zealand"},
            'SYD': {"City": "Sydney", "Zip": 2014, "State": "New South Wales", "Country": "Australia"},
            'LHR': {"City": "London", "Zip": 2015, "State": "England", "Country": "United Kingdom"},
            'CDG': {"City": "Paris", "Zip": 2016, "State": "Ile-de-France", "Country": "France"},
            'FRA': {"City": "Frankfurt", "Zip": 2017, "State": "Hesse", "Country": "Germany"}}

# Airline companies
AIRLINES = ['Air New Zealand', 'Air France', 'Alaska Airlines', 'American Airlines',
            'British Airways', 'Delta Airlines', 'Frontier Airlines',
            'JetBlue', 'Southwest Airlines', 'United Airlines', 'Virgin America']


def random_date(start, end):
    """
    Returns a random datetime between two datetime objects.
    """
    delta = end - start
    int_delta = (delta.days * 24 * 60 * 60) + delta.seconds
    random_second = randrange(int_delta)
    return start + timedelta(seconds=random_second)


def gen_occupancy(capacity, full=False):
    """ Generate a random occupancy for a flight
    full: whether the flight is full or not"""

    return randrange(0, capacity) if not full else 0


def gen_price(min_price=100, max_price=300, upscale=1):
    """ Generate a random price for a flight
    upscale: how much more expensive the flight is compared to the base price"""

    return randrange(min_price * upscale, max_price * upscale)


def create_airport_tables():
    """ Create airport, airport_location and location tables """

    airport_df = pd.DataFrame(columns=['ID', 'Name'])
    airport_location_df = pd.DataFrame(columns=['ID', 'Location ID', 'Airport ID'])
    location_df = pd.DataFrame(columns=['ID', 'City', 'Zip', 'State', 'Country'])

    for i, (airport, location) in enumerate(AIRPORTS.items()):
        airport_df.loc[i] = [i, airport]
        airport_location_df.loc[i] = [i, i, i]
        location_df.loc[i] = [i, location['City'], location['Zip'], location['State'], location['Country']]

    return airport_df, airport_location_df, location_df


def create_tables(d1, num_flights=50):
    """ Create all tables """

    airport_df, airport_location_df, location_df = create_airport_tables()

    flight_df = pd.DataFrame(columns=['Flight ID', 'Number', 'Company',
                                      'A_capacity', 'A_occupancy', 'A_fare',
                                      'B_capacity', 'B_occupancy', 'B_fare',
                                      'C_capacity', 'C_occupancy', 'C_fare'])
    departure_df = pd.DataFrame(columns=['ID', 'Airport ID', 'Flight ID', 'Date Time'])
    lands_df = pd.DataFrame(columns=['ID', 'Airport ID', 'Flight ID', 'Date Time'])

    base_capacity = 200

    for i in range(num_flights):
        # Setting every 10th flight to be full
        full = True if i % 10 == 0 else False

        # Randomly selecting an airline
        airline = random.sample(AIRLINES, 1)[0]

        # Randomly construct a sample flight df
        flight_df.loc[i] = [i, f"{airline}_{randrange(1, 20)}", airline,
                            base_capacity, gen_occupancy(base_capacity, full), gen_price(),
                            int(base_capacity / 2), gen_occupancy(int(base_capacity / 2), full), gen_price(upscale=2),
                            int(base_capacity / 4), gen_occupancy(int(base_capacity / 4), full), gen_price(upscale=10)]

        # Calculate random departure and landing times
        departure_time = random_date(d1, d1 + timedelta(hours=12))
        lands_time = random_date(departure_time, departure_time + timedelta(hours=12))

        # Create departure and landing tables
        departure_df.loc[i] = [i, randrange(0, 13), i, departure_time]
        lands_df.loc[i] = [i, randrange(0, 13), i, lands_time]

    tables = (airport_df, airport_location_df, location_df, flight_df, departure_df, lands_df)
    return tables


def main():
    # Creating a random date a month into the future
    today = datetime.today()
    d1 = today + timedelta(days=30)

    tables = create_tables(d1)
    table_names = ['airport', 'airport_location', 'location', 'flight', 'departure', 'lands']

    # Write tables to csv files
    for i, table in enumerate(tables):
        table.to_csv(f"output_tables/{table_names[i]}.csv", index=False, header=False)
    print("Tables written to csv file")


if __name__ == "__main__":
    main()
