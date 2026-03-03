import { Link } from "react-router-dom";

export default function Navbar() {
  return (
    <nav className="navbar">
      <Link to="/">Inicio</Link>
      <Link to="/gen1">Gen1</Link>
      <Link to="/gen2">Gen2</Link>
      <Link to="/gen3">Gen3</Link>
      <Link to="/digimon">Digimon</Link>
    </nav>
  );
}
