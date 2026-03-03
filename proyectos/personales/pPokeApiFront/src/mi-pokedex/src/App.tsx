import { Routes, Route } from "react-router-dom";
import Navbar from "./components/Navbar";
import Inicio from "./pages/Inicio";
import Gen1 from "./pages/Gen1";
import Gen2 from "./pages/Gen2";
import Gen3 from "./pages/Gen3";
import Digimon from "./pages/Digimon";

export default function App() {
  return (
    <>
      <header className="hero-header">
        <div className="hero-content">
          <h1>PokeApi Eliel Zeta</h1>
        </div>
      </header>

      <Navbar />

      <Routes>
        <Route path="/" element={<Inicio />} />
        <Route path="/gen1" element={<Gen1 />} />
        <Route path="/gen2" element={<Gen2 />} />
        <Route path="/gen3" element={<Gen3 />} />
        <Route path="/digimon" element={<Digimon />} />
        <Route path="*" element={<img src="/404.webp" />} />
      </Routes>
    </>
  );
}
