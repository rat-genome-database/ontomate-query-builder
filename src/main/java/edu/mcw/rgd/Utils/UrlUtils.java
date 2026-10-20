package edu.mcw.rgd.Utils;

import edu.mcw.rgd.services.RgdContext;

import java.net.UnknownHostException;

/**
 * Base URLs of the RGD resources QueryBuilder links to.
 *
 * QueryBuilder is served from two servers:
 *   - dev, where rgdweb.war is deployed next to QueryBuilder, so rgdweb links stay
 *     relative and resolve against whatever host the user came in on
 *   - ontomate, which serves QueryBuilder only, so rgdweb links must point at the
 *     production rgdweb.war on rgd.mcw.edu
 *
 * Created by jthota on 10/20/2026.
 */
public class UrlUtils {

    private static final String RGDWEB_URL_RELATIVE = "/rgdweb";
    private static final String RGDWEB_URL_PRODUCTION = "https://rgd.mcw.edu/rgdweb";

    private static final String SITE_HOST_DEV = "dev.rgd.mcw.edu";
    private static final String SITE_HOST_ONTOMATE = "ontomate.rgd.mcw.edu";

    /**
     * Base URL of rgdweb.war, without a trailing slash: relative when rgdweb is deployed
     * alongside QueryBuilder, absolute to production otherwise.
     */
    public static String getRgdWebUrl() {
        return isDev() ? RGDWEB_URL_RELATIVE : RGDWEB_URL_PRODUCTION;
    }

    /** Host name of the server this QueryBuilder instance is served from. */
    public static String getSiteHostName() {
        return isDev() ? SITE_HOST_DEV : SITE_HOST_ONTOMATE;
    }

    /** Base URL of the server this QueryBuilder instance is served from, without a trailing slash. */
    public static String getSiteUrl() {
        return "https://" + getSiteHostName();
    }

    /**
     * If the local host name cannot be resolved we cannot tell which server we are on, so fall
     * back to the non-dev answer: the absolute production URLs are valid from either server,
     * while the relative ones only resolve where rgdweb.war is deployed.
     */
    private static boolean isDev() {
        try {
            return RgdContext.isDev();
        } catch (UnknownHostException e) {
            e.printStackTrace();
            return false;
        }
    }
}
