From: Samuel Thibault <samuel.thibault-vYW+cPY1g1pg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCHv2][input-led] Defer input led work to workqueue
Date: Tue, 26 Aug 2014 15:32:38 +0200
Message-ID: <20140826133238.GA28108@type.bordeaux.inria.fr>
References: <20140826015453.GA5235@type.youpi.perso.aquilenet.fr>
 <20140826091725.GA23293@type.youpi.perso.aquilenet.fr>
 <1409059327.22232.0.camel@jlt4.sipsolutions.net>
 <20140826132410.GD3186@type.bordeaux.inria.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140826132410.GD3186-hVaJJPvgRkSHR6PIDP45TBlftxrVp6Uy@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, Hugh Dickins <hughd-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, Sabrina Dubroca <sd-y1jBWg8GRStKuXlAQpz2QA@public.gmane.org>, Valdis.Kletnieks-PjAqaU27lzQ@public.gmane.org, Vincent Donnefort <vdonnefort-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Samuel Thibault, le Tue 26 Aug 2014 15:24:10 +0200, a =E9crit :
> Johannes Berg, le Tue 26 Aug 2014 15:22:07 +0200, a =E9crit :
> > On Tue, 2014-08-26 at 11:17 +0200, Samuel Thibault wrote:
> >=20
> > > -	led_trigger_event(&vt_led_triggers[led], !!brightness);
> > > +	vt_led_state[led] =3D !!brightness;
> > > +	schedule_work(&vt_led_work[led]);
> >=20
> >=20
> > > +static int __init input_led_init(void)
> > > +{
> > > +	unsigned i;
> > > +
> > > +	for (i =3D 0; i < LED_CNT; i++)
> > > +		INIT_WORK(&vt_led_work[i], vt_led_cb);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void __exit input_led_exit(void)
> > > +{
> > > +}
> >=20
> > Come to think of it - don't you need to cancel_work_sync() in exit =
so
> > the work struct can't be queued while the module is being unloaded?
>=20
> Well, this is never built as a module ATM, so it's not a problem.

(but I have changed that for future versions of the whole patch, yes)

Samuel
--
To unsubscribe from this list: send the line "unsubscribe linux-wireles=
s" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
