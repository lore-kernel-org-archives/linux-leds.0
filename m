From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: Re: [PATCHv2][input-led] Defer input led work to workqueue
Date: Tue, 26 Aug 2014 15:24:10 +0200
Message-ID: <20140826132410.GD3186@type.bordeaux.inria.fr>
References: <20140826015453.GA5235@type.youpi.perso.aquilenet.fr>
 <20140826091725.GA23293@type.youpi.perso.aquilenet.fr>
 <1409059327.22232.0.camel@jlt4.sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:23089
	"EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754695AbaHZNYN (ORCPT
	<rfc822;linux-leds@vger.kernel.org>);
	Tue, 26 Aug 2014 09:24:13 -0400
Content-Disposition: inline
In-Reply-To: <1409059327.22232.0.camel@jlt4.sipsolutions.net>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Hugh Dickins <hughd@google.com>, akpm@linux-foundation.org, Sabrina Dubroca <sd@queasysnail.net>, Valdis.Kletnieks@vt.edu, Vincent Donnefort <vdonnefort@gmail.com>, Bryan Wu <cooloney@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org

Johannes Berg, le Tue 26 Aug 2014 15:22:07 +0200, a =E9crit :
> On Tue, 2014-08-26 at 11:17 +0200, Samuel Thibault wrote:
>=20
> > -	led_trigger_event(&vt_led_triggers[led], !!brightness);
> > +	vt_led_state[led] =3D !!brightness;
> > +	schedule_work(&vt_led_work[led]);
>=20
>=20
> > +static int __init input_led_init(void)
> > +{
> > +	unsigned i;
> > +
> > +	for (i =3D 0; i < LED_CNT; i++)
> > +		INIT_WORK(&vt_led_work[i], vt_led_cb);
> > +
> > +	return 0;
> > +}
> > +
> > +static void __exit input_led_exit(void)
> > +{
> > +}
>=20
> Come to think of it - don't you need to cancel_work_sync() in exit so
> the work struct can't be queued while the module is being unloaded?

Well, this is never built as a module ATM, so it's not a problem.

Samuel
