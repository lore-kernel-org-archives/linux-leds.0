Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D6F4C2B9F4
	for <linux-leds@archiver.kernel.org>; Fri, 25 Jun 2021 20:40:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B2296197C
	for <linux-leds@archiver.kernel.org>; Fri, 25 Jun 2021 20:40:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbhFYUmZ (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 25 Jun 2021 16:42:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbhFYUmZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 25 Jun 2021 16:42:25 -0400
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B128C061574;
        Fri, 25 Jun 2021 13:40:04 -0700 (PDT)
Received: from thinkpad (unknown [172.20.6.87])
        by mail.nic.cz (Postfix) with ESMTPSA id CA0A2140BC1;
        Fri, 25 Jun 2021 22:40:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1624653601; bh=7qzL0OX4Gpt8h15fDizf86ZLAdjUeEyyZG8sbTqv9AE=;
        h=Date:From:To;
        b=VmHOr7sE0at2TEWZbQpSRpDKFEgJDru6nmA+jyeDNZ+hyBmmzgvIU/k3qS0VSwlFw
         Sd7Cr+14ogs6k7HA5fGYvlI/FkzyjtMH7aIIiV72LwzZJOHNMaMoc0hYChL/hQbHHw
         06g/FWRTirvK2tOOAfsZo2f59tKfAXL8kxPGBmhA=
Date:   Fri, 25 Jun 2021 22:40:01 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 18/18] auxdisplay: ht16k33: Add segment display LED
 support
Message-ID: <20210625224001.115c938a@thinkpad>
In-Reply-To: <20210625223916.7e00e710@thinkpad>
References: <20210625125902.1162428-1-geert@linux-m68k.org>
        <20210625125902.1162428-19-geert@linux-m68k.org>
        <20210625223916.7e00e710@thinkpad>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 25 Jun 2021 22:39:16 +0200
Marek Behun <marek.behun@nic.cz> wrote:

> On Fri, 25 Jun 2021 14:59:02 +0200
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> 
> > Instantiate a single LED for a segment display.  This allows the user to
> > control display brightness and blinking through the LED class API and
> > triggers, and exposes the display color.
> > The LED will be named "auxdisplay:<color>:backlight".  
> 
> What if there are multiple "auxdisplay"s ?
> Doesn't this subsystem have IDs? So that you can use auxdisplayN for
> device name, for example?

Or if this driver creates a fbdev, maybe "fb<N>" for devicename?

Marek
