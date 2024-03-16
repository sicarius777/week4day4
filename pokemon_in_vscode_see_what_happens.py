import requests

base_url = 'https://pokeapi.co/api/v2/'

def get_pokemon_data(pokemon_name):
    pokemon_url = base_url + 'pokemon/' + pokemon_name.lower()
    response = requests.get(pokemon_url)
    if response.status_code == 200:
        pokemon_data = response.json()
        
        name = pokemon_data['name'].capitalize()
        base_experience = pokemon_data['base_experience']
        sprite_url = pokemon_data['sprites']['front_shiny']
        abilities = [ability['ability']['name'] for ability in pokemon_data['abilities']]
        attack_base_stat = pokemon_data['stats'][1]['base_stat']  # Index 1 corresponds to attack stat
        hp_base_stat = pokemon_data['stats'][0]['base_stat']  # Index 0 corresponds to HP stat
        defense_base_stat = pokemon_data['stats'][2]['base_stat']  # Index 2 corresponds to defense stat
        
        pokemon_info = {
            'Name': name,
            'Abilities': abilities,
            'Base Experience': base_experience,
            'Sprite URL': sprite_url,
            'Attack Base Stat': attack_base_stat,
            'HP Base Stat': hp_base_stat,
            'Defense Base Stat': defense_base_stat
        }
        
        return pokemon_info

pokemon_name = 'gengar'
gengar_data = get_pokemon_data(pokemon_name)
if gengar_data:
    print("Pokemon Information:")
    for key, value in gengar_data.items():
        print(f"{key}: {value}")

# much prettier
# oops didnt install the requests