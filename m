From: Samuel Thibault <samuel.thibault-vYW+cPY1g1pg9hUCZPvPmw@public.gmane.org>
Subject: Re: 3.17-rc1: leds blink workqueue causes sleeping BUGs
Date: Mon, 25 Aug 2014 23:37:52 +0200
Message-ID: <20140825213752.GD3070@type.youpi.perso.aquilenet.fr>
References: <alpine.LSU.2.11.1408161946450.1064@eggly.anvils>
 <10857.1408467967@turing-police.cc.vt.edu>
 <20140825211340.GA22168@kria>
 <20140825212324.GC3070@type.youpi.perso.aquilenet.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140825212324.GC3070-ImhJuBFkDxsZRTKc5xlRkz/bP2T7CorvwZZFX4Cs8Hg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sabrina Dubroca <sd-y1jBWg8GRStKuXlAQpz2QA@public.gmane.org>, Valdis.Kletnieks-PjAqaU27lzQ@public.gmane.org, Hugh Dickins <hughd-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Vincent Donnefort <vdonnefort-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Samuel Thibault, le Mon 25 Aug 2014 23:23:24 +0200, a =E9crit :
> We could indeed have a loop if the user was making the VT::* leds use
> the vt-* trigger,

Actually, while there can be a loop, it wouldn't be possible to inject
events in it: a VT::* led only makes the corresponding vt-* trigger if
it got an event from its trigger, etc. So it's really a false positive,
the lock detector just can not know that it can not happen.

Samuel
--
To unsubscribe from this list: send the line "unsubscribe linux-wireles=
s" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
