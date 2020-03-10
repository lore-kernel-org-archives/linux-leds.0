Return-Path: <SRS0=y+HI=43=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60EA5C18E5A
	for <linux-leds@archiver.kernel.org>; Tue, 10 Mar 2020 17:47:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0F501222C3
	for <linux-leds@archiver.kernel.org>; Tue, 10 Mar 2020 17:47:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=blackhole.sk header.i=@blackhole.sk header.b="tgm5isMd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726990AbgCJRrn (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 10 Mar 2020 13:47:43 -0400
Received: from mail-proxyout-mua-31.websupport.eu ([37.9.172.181]:43954 "EHLO
        mail-proxyout-mua-31.websupport.eu" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727354AbgCJRrm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 10 Mar 2020 13:47:42 -0400
X-Greylist: delayed 554 seconds by postgrey-1.27 at vger.kernel.org; Tue, 10 Mar 2020 13:47:41 EDT
Received: from in-3.websupport.sk (unknown [10.10.2.103])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail-proxyout-mua-31.websupport.eu (Postfix) with ESMTPS id 6BDCFC8596;
        Tue, 10 Mar 2020 18:38:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=blackhole.sk;
        s=mail; t=1583861905;
        bh=8OuXqSLvawrH4AYXXoi3pR7hm89dQfL/EYiVWisK4vM=;
        h=Date:From:To:Cc:Subject;
        b=tgm5isMdqagDRbbEyuOCeTxNowl3ZxsY0OdlvbiEJZYeOSpImUKmyCCA+0Ul2xWSR
         gWBw0HT3iNkRasZlT8CAHU0Hecg+N1M+5FfN/X2mKyMsJrHxssG1GlMRDaQXv/IERN
         L9x18eu/xy54kHTUmSiYG8fcnAB3IJdY/uRv9vHQ=
Received: from localhost (otava-0257.koleje.cuni.cz [78.128.181.4])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kabel@blackhole.sk)
        by in-3.websupport.sk (Postfix) with ESMTPSA id 48cMkn0hpPz3LyvB;
        Tue, 10 Mar 2020 18:38:25 +0100 (CET)
Date:   Tue, 10 Mar 2020 18:38:24 +0100
From:   Marek Behun <kabel@blackhole.sk>
To:     linux-leds@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
Subject: turris omnia leds again: question
Message-ID: <20200310183824.1e4ad91d@blackhole.sk>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

I am going to try to send driver for Omnia LEDs again. The last time
there was a problem: on 05/01/2019 Jacek wrote:

> I wonder if we're doing right merging this driver in this form.
> We break the rule one-led-class-device-per-one-channel. We don't
> have LED multi color support yet, so this should support RGB LEDs
> in the old manner. Or switch to using LED multi color class.

> Once we will have LED multi color class, we will be able to add the
> support for it to the driver and make the driver configurable to be
> able to expose old interface or the LED multi color one.

> Moreover, the bindings should use led-sources property for grouping
> three channels under single LED class device. This is certainly to be
> fixed.

So I am going to try to modify the driver so that each channel creates
one LED class device. Do I understand this correctly then, that this
way when there are three channels (RGB) on one LED, all the 3 device
tree nodes for should have the same reg property, but different
led-sources property? Eg:

  led@0,0 {
    reg = <0>;
    led-sources = <0>;
    label = "omnia::heartbeat::red";
  };

  led@0,1 {
    reg = <0>;
    led-sources = <1>;
    label = "omnia::heartbeat::green";
  };

  led@0,2 {
    reg = <0>;
    led-sources = <2>;
    label = "omnia::heartbeat::blue";
  };

Or did I misinterpret the led-sources property?

Thanks, Marek.
