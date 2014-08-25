From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: Re: 3.17-rc1: leds blink workqueue causes sleeping BUGs
Date: Mon, 25 Aug 2014 23:23:24 +0200
Message-ID: <20140825212324.GC3070@type.youpi.perso.aquilenet.fr>
References: <alpine.LSU.2.11.1408161946450.1064@eggly.anvils>
 <10857.1408467967@turing-police.cc.vt.edu>
 <20140825211340.GA22168@kria>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from toccata.ens-lyon.org ([140.77.166.68]:43561 "EHLO
	toccata.ens-lyon.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755176AbaHYVcf (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 25 Aug 2014 17:32:35 -0400
Content-Disposition: inline
In-Reply-To: <20140825211340.GA22168@kria>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: Valdis.Kletnieks@vt.edu, Hugh Dickins <hughd@google.com>, Vincent Donnefort <vdonnefort@gmail.com>, Bryan Wu <cooloney@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org

Hello,

Sabrina Dubroca, le Mon 25 Aug 2014 23:13:40 +0200, a =E9crit :
> 2014-08-19, 13:06:07 -0400, Valdis.Kletnieks@vt.edu wrote:
> > On Sat, 16 Aug 2014 20:27:01 -0700, Hugh Dickins said:
> > > Can we safely revert your 8b37e1bef5a6 ("leds: convert blink time=
r to
> > > workqueue"), or have there been other changes which now depend up=
on it?
> >=20
> > I suspect there's something else busted.  I hand-reverted that patc=
h, and I *still*
> > see the following lockdep whine that looks related (as it talks abo=
ut
> > leddev_list_lock).  next-0811 was OK, looks like next-0815 and -081=
8 had this....
>=20
> I had a look at the code, led_trigger_event calls vt_led_set, which
> calls led_trigger_event again.

Yes, that is expected: the vt::* leds actually generate the
corresponding vt-* trigger events, which are used by the various
input*::* leds. We could indeed have a loop if the user was making the
VT::* leds use the vt-* trigger, but otherwise it's safe since it's a
different trigger. We can add code to prevent the user from building
loops, but otherwise it's a false positive.

Samuel
