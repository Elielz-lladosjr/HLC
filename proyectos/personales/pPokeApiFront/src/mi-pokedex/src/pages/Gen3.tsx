import { useEffect, useState } from "react";
import Card from "../components/Card";

export default function Gen1() {
  const [pokemons, setPokemons] = useState<any[]>([]);

  useEffect(() => {
    async function loadPokemons() {
      const ids = Array.from({ length: 10 }, () =>
    Math.floor(Math.random() * 135) + 252
      );

      const data = await Promise.all(
        ids.map(id =>
          fetch(`https://pokeapi.co/api/v2/pokemon/${id}`).then(res => res.json())
        )
      );

      setPokemons(data);
    }

    loadPokemons();
  }, []);

  return (
    <div className="grid">
      {pokemons.map(p => (
    <Card
  key={p.id}
  id={p.id}
  name={p.name}
  img={p.sprites.other["official-artwork"].front_default}
  hp={p.stats[0].base_stat}
  attack={p.stats[1].base_stat}
  defense={p.stats[2].base_stat}
  xp={p.base_experience}
/>


      ))}
    </div>
  );
}
