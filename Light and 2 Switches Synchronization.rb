alias: Pasillo - Conmutado Luces
description: Sincroniza los interruptores de luces del pasillo
triggers:
  - entity_id:
      - light.pasillo_dimmer_luces
      - switch.salon_interruptor_luces_pasillo_up
      - switch.pasillo_interruptor_luces_dormitorio_up
    trigger: state
actions:
  - target:
      entity_id: |
        {% set entities = [
          'light.pasillo_dimmer_luces',
          'switch.salon_interruptor_luces_pasillo_up',
          'switch.pasillo_interruptor_luces_dormitorio_up'
        ] %} {{ entities | reject('eq', trigger.entity_id) | list }}
    action: |
      {% if trigger.to_state.state == 'on' %}
        homeassistant.turn_on
      {% else %}
        homeassistant.turn_off
      {% endif %}
mode: single
