Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB8EC4338F
	for <linux-leds@archiver.kernel.org>; Tue, 10 Aug 2021 09:22:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 126A860F56
	for <linux-leds@archiver.kernel.org>; Tue, 10 Aug 2021 09:22:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238898AbhHJJXU (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 10 Aug 2021 05:23:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238854AbhHJJXL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 10 Aug 2021 05:23:11 -0400
Received: from orbyte.nwl.cc (orbyte.nwl.cc [IPv6:2001:41d0:e:133a::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDEF0C0613D3
        for <linux-leds@vger.kernel.org>; Tue, 10 Aug 2021 02:22:48 -0700 (PDT)
Received: from n0-1 by orbyte.nwl.cc with local (Exim 4.94.2)
        (envelope-from <n0-1@orbyte.nwl.cc>)
        id 1mDNyA-0000x1-3U; Tue, 10 Aug 2021 11:22:46 +0200
Date:   Tue, 10 Aug 2021 11:22:46 +0200
From:   Phil Sutter <phil@nwl.cc>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: Add invert attribute to ledtrig-audio
Message-ID: <20210810092246.GB3673@orbyte.nwl.cc>
References: <20210809122910.11580-1-phil@nwl.cc>
 <20210809181118.GA16184@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210809181118.GA16184@duo.ucw.cz>
Sender:  <n0-1@orbyte.nwl.cc>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

On Mon, Aug 09, 2021 at 08:11:18PM +0200, Pavel Machek wrote:
> > Inverting micmute LED used to be possible via a mixer setting, but
> > conversion to LEDs class (probably) killed it. Re-establish the old
> > functionality via sysfs attribute in audio LED triggers.
> 
> So we have both invert and inverted attributes. Fun :-).

Hmm! :)

Are you talking about LED_BLINK_INVERT flag? I see a few triggers allow
inversion but didn't find LED drivers exporting such a property.

> See sysfs-class-led and sysfs-class-led-trigger-oneshot.

I think I "copied" from oneshot trigger when writing this patch.

> We definitely want this documented. We probably want this for most
> triggers, maybe it should get one implementation in library somewhere?

Should this be an implicit attribute of simple triggers only or all? In
the latter case (which could simplify some triggers) I guess the value
inversion has to take place in led_set_brightness_nopm(), the lowest
level function triggers may use.

How does inversion work, actually? LED_OFF <-> LED_ON is trivial, but
what about LED_HALF and LED_FULL? Leaving LED_HALF as-is seems logical,
but the opposite of LED_OFF might be LED_ON or LED_FULL. Does
max_brightness determine that?

> 
> Otherwise it makes sense.
> 
> > +static ssize_t do_invert_store(enum led_audio type,
> > +			       const char *buf, size_t size)
> > +{
> > +	unsigned long state;
> > +	int ret;
> > +
> > +	ret = kstrtoul(buf, 0, &state);
> > +	if (ret)
> > +		return ret;
> > +
> > +	led_invert[type] = !!state;
> > +	ledtrig_audio_set(type, audio_state[type]);
> 
> Accepting 42 as valid value sounds wrong. Anyway, this should do what
> oneshot trigger does.

Similarities to oneshot are not a coincidence. :)

Cheers, Phil
