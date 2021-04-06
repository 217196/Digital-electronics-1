# Traffic Lights
## State table

| **Input P** | `0` | `0` | `1` | `1` | `0` | `1` | `0` | `1` | `1` | `1` | `1` | `0` | `0` | `1` | `1` | `1` |
| :-- | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
| **Clock** | up | up | up | up | up | up | up | up | up | up | up | up | up | up | up | up |
| **State** | A | A | B | C | C | D | A | B | C | D | B | B | B | C | D | B |
| **Output R** | `0` | `0` | `0` | `0` | `0` | `1` | `0` | `0` | `0` | `1` | `0` | `0` | `0` | `0` | `1` | `0` |

## RGB LEDs table

| **RGB LED** | **Artix-7 pin names** | **Red** | **Yellow** | **Green** |
| :-: | :-: | :-: | :-: | :-: |
| LD16 | N15, M16, R12 | `1,0,0` | `1,1,0` | `0,1,0` |
| LD17 | N16, R11, G14 | `1,0,0` | `1,1,0` | `0,1,0` |

## Traffic light controller

### State diagram

###  Listing of VHDL code of sequential process p_traffic_fsm with syntax highlighting

### Listing of VHDL code of combinatorial process p_output_fsm with syntax highlighting

### Screenshot(s) of the simulation

## Smart controller
### State table

| **current** | **x** | **-> west** | **-> south** | **both directions** |
| :-- | :-: | :-: | :-: | :-: |
| `WEST_GO`    | `WEST_GO`    | `WEST_GO` | `WEST_WAIT` | `WEST_WAIT` |
| `WEST_WAIT`  | `SOUTH_GO` | `SOUTH_GO` | `SOUTH_GO` | `SOUTH_GO` |
| `SOUTH_GO`   | `SOUTH_GO`  | `SOUTH_WAIT` | `SOUTH_GO` | `SOUTH_WAIT` |
| `SOUTH_WAIT` | `WEST_GO` | `WEST_GO` | `WEST_GO` | `WEST_GO` |
### State diagram

### Listing of VHDL code of sequential process p_smart_traffic_fsm with syntax highlighting
