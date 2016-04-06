From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: nand-disk LED trigger: to remove, or not to remove
Date: Wed, 6 Apr 2016 11:03:16 -0700
Message-ID: <20160406180316.GA11756@localhost>
References: <20160405195120.GA6111@laptop.cereza>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:34518 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752636AbcDFSDa (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 6 Apr 2016 14:03:30 -0400
Received: by mail-pa0-f44.google.com with SMTP id fe3so37657506pab.1
        for <linux-leds@vger.kernel.org>; Wed, 06 Apr 2016 11:03:30 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20160405195120.GA6111@laptop.cereza>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org

On Tue, Apr 05, 2016 at 04:51:20PM -0300, Ezequiel Garcia wrote:
> Due to the way the 'nand-disk' LED trigger is implemented,
> it currently does not work correctly for all NAND drivers.
>=20
> This is somewhat related to an old thread, where we discussed
> the addition of an "mtd" LED trigger. See:
>=20
>   http://www.spinics.net/lists/linux-leds/msg01181.html
>=20
> My question is:
>=20
>  * given that nobody has complained about "nand-disk"
>    working on just some NAND drivers, and...
>  * given that nobody has complained (except that 2013 patch)
>    about lacking a generic MTD LED trigger...
>=20
> Does it make any sense to have such a trigger at all?
> In other words, should we simply get rid of "nand-disk" trigger?

I don't have much opinion about the LED trigger, except that it'd be
nice if it either worked consistently or was removed.

> In case the answer is "We want to keep some LED trigger",
> then here's a patch for you to f=CC=B6l=CC=B6a=CC=B6m=CC=B6e=CC=B6  r=
eview:
>=20
> From 88c7102bb67056b443da323bd3e28b60aca948a2 Mon Sep 17 00:00:00 200=
1
> From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> Date: Sat, 2 Apr 2016 18:35:50 -0300
> Subject: [PATCH] leds: trigger: Introduce a MTD (NAND/NOR) trigger
>=20
> This commit introduces a MTD trigger for flash (NAND/NOR) device
> activity. The implementation is copied from IDE disk.
>=20
> This deprecates the "nand-disk" LED trigger, but for backwards
> compatibility, we still keep the "nand-disk" trigger around.
>=20
> The motivation for deprecating the "nand-disk" LED trigger is that
> it only works for NAND drivers, whereas the "mtd" LED trigger
> is more generic (in fact, "nand-disk" currently only works for
> certain NAND drivers).
>=20
>   TODO: Measure how the trigger affects MTD I/O performance.
>   It should be cheap because the blink is deferred, but still
>   it makes sense to provide some hard numbers.
>=20
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

[...]

Notably, your patch changes the behavior pretty significantly. Instead
of triggering for individual NAND wait periods (very fine-grained) you
only trigger for entire write/read/erase operations. That may be OK,
especially if it's modelled after IDE.

I'd also note that you missed a few APIs (e.g., mtd_{read,write}_oob())=
=2E

Brian
