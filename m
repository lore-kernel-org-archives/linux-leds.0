Return-Path: <SRS0=2Rjj=BG=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A945C433E0
	for <linux-leds@archiver.kernel.org>; Mon, 27 Jul 2020 09:40:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4D112070B
	for <linux-leds@archiver.kernel.org>; Mon, 27 Jul 2020 09:40:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="g7QwEK9H"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgG0Jkx (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Mon, 27 Jul 2020 05:40:53 -0400
Received: from lists.nic.cz ([217.31.204.67]:48494 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726139AbgG0Jkx (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 27 Jul 2020 05:40:53 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTPSA id 9154F140B40;
        Mon, 27 Jul 2020 11:40:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1595842851; bh=oSXxBoIBqEJHSW0Wc8uLQ5Lss59vKmZ2KArZ22xWUqQ=;
        h=Date:From:To;
        b=g7QwEK9HqYxdif+bilfhYc48YE5T3EtdmYy9DpKRa/CA86d93u7FRk5IGjlOm8t44
         NGwjK/BCn3yOgip5anRLrrHADYctA1s8rFDZxK00bA6wMrTu9QYMvYnxNNi05GjBQC
         5ozqRuvI2K/iXPPlTBQvCQLdFoEa1b4+kAxG0M7k=
Date:   Mon, 27 Jul 2020 11:40:48 +0200
From:   Marek =?ISO-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     jacek.anaszewski@gmail.com, dmurphy@ti.com,
        linux-leds@vger.kernel.org
Subject: Re: We have multicolor, but should we turn it into RGB?
Message-ID: <20200727114048.32f36c59@dellmb.labs.office.nic.cz>
In-Reply-To: <20200727084500.GA15237@amd>
References: <20200727084500.GA15237@amd>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 27 Jul 2020 10:45:00 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> Hi!
> 
> Multicolor is a bit too abstract. Yes, we can have
> Green-Magenta-Ultraviolet LED, but so far all the LEDs we support are
> RGB, and not even RGB-White or RGB-Yellow variants emerged.
> 
> Multicolor is not a good fit for RGB LED. It does not really know
> about LED color.  In particular, there's no way to make LED "white".
> 
> Userspace is interested in knowing "this LED can produce arbitrary
> color", which not all multicolor LEDs can.
> 
> 	Proposal: let's add "rgb" to led_colors in
> 	drivers/leds/led-core.c, add corresponding device tree
> 	defines, and use that, instead of multicolor for RGB LEDs.
> 
> 	We really need to do that now; "white" stuff can wait.
> 
> RGB LEDs are quite common, and it would be good to be able to turn LED
> white and to turn it into any arbitrary color. It is essential that
> userspace is able to set arbitrary colors, and it might be good to
> have that ability from kernel, too... to allow full-color triggers.
> 
> Best regads,
> 									Pavel

I am not against adding RGB if you want to somehow teach the subsystem
to mix arbitrary color (either by teaching it color curves or some
other way). But I think we shouldn't remove multicolor, and here's the
reason why:

Most of the time I have seen 2 LEDs per ethernet port, green and yellow,
but some ports have 2 Bi-Color LEDs, each consisting of green and
yellow. I think most of the time these are 2-terminal LEDs.

So basically here we have, instead of a RGB LED, a GY LED (GY for
green/yellow).

Marvell PHYs support something they call Bi-Color LED Mixing. Normally
the LED can be either in ON or OFF state (in terms of LED API
max_brightness = 1), but with Bi-Color LED Mixing the 2-terminal
GY LED supports max_brightness = 8 for both green and yellow
channels.

Moreover Marvell PHYs support something called DUAL modes. This
basically means that this GY LED can be controlled by hardware in
several ways. For example one of these DUAL modes has following
behavior:

		LED[1]		LED[0]
1000 noact	Off		Solid On
1000   act	Off		Blink
 100 noact	Solid Mix	Solid Mix
 100   act	Blink Mix	Blink Mix
  10 noact	Solid On	Off
  10   act	Blink		Off
nolink		Off		Off

So if we want to reasonably add support for this configuration of LEDs
and to offer the user to configure these DUAL modes via the trigger
API, I think these LEDs should be shown in the system as multicolor
LEDs.

Marek
