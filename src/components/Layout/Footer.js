import { Link } from "react-router-dom";
import { useContext } from "react";
import AuthContext from "../../store/auth-context";

import classes from "./Footer.module.css";

const Footer = () => {
    const authCtx = useContext(AuthContext);

    // const isLoggedIn = { authCtx };
    const isLoggedIn = authCtx.isLoggedIn;
    const logoutHandler = () => {
        authCtx.logout();
        // optional: redirect the user
    };
    return (
        <footer className="footer-grid-container">
            <div className="footer-links">
                <Link to="/">© Copyright 2021 Soar Inc.</Link>
                |
                <Link to="/"> Phone: (123) 456-7890 </Link>
                |
                <Link to="/"> Email:  help@soar.com </Link>

            </div>

        </footer>
    );
};

export default Footer;
