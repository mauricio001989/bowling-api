# README

# Gems extras in the project
 - Active_model_serializers
 - Factory_bot_rails
 - Faker
 - i18n
 - Interactor
 - Simplecov
 - Rack-cors
 - Rubocop
 - Rspec-rails
 - Versionist
 
 
# Created models
- BowlingGame 
- BowlingLane
- Users

# Bowling game

#### GET  /api/v1/bowling_games               (INDEX)
#### GET  /api/v1/bowling_games/1             (SHOW)
#### POST /api/v1/bowling_games               (CREATE)
#### PATCH/PUT /api/v1/bowling_games/points   (UPDATE)


## Examples of SHOW, CREATE and UPDATE



- CREATE POST params(user_id, bowling_lane_id)

https://bowling-api-mao.herokuapp.com/api/v1/bowling_games?locale=es
```
{
	"bowling_game":{
        "user_id": "1",
        "bowling_lane_id":"1"
	}
}
```

- UPDATE PUT params (id_bowling_game, points)

https://bowling-api-mao.herokuapp.com/api/v1/bowling_games/points?locale=es

```
{
 	"id":1,
	 "points": 10
}
```

