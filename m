Return-Path: <SRS0=y+HI=43=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B546C10F27
	for <linux-leds@archiver.kernel.org>; Tue, 10 Mar 2020 17:39:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D6C5321D7E
	for <linux-leds@archiver.kernel.org>; Tue, 10 Mar 2020 17:39:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="YhZYm2VD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgCJRjt (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 10 Mar 2020 13:39:49 -0400
Received: from mail.nic.cz ([217.31.204.67]:46490 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726283AbgCJRjt (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 10 Mar 2020 13:39:49 -0400
Received: from localhost (unknown [172.20.6.135])
        by mail.nic.cz (Postfix) with ESMTPSA id A0186141A99
        for <linux-leds@vger.kernel.org>; Tue, 10 Mar 2020 18:39:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1583861987; bh=dpY3UgiTOJWJrLlq/vfYcphCqQIV2DojNxZQ5XGukq8=;
        h=Date:From:To;
        b=YhZYm2VDs9SupJQWP0MNrMStiP40SMS9mUkS+4pTz9xL8XDkAoDmms0V7gS+vlJpy
         JY871CSTBNrnFWMr5S9WZ7DCyY5ZovmYyaQRf0h3AVq2h5mEhOOVSD4LVxY0HIO1l0
         KQqMtqP+bQSbUpGPQf+mA1SDJpR5Dk0bi4IzrriI=
Date:   Tue, 10 Mar 2020 18:39:47 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Subject: turris omnia leds again: question RESEND
Message-ID: <20200310183947.198eac12@nic.cz>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.101.4 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

(sorry for the spam, I accidently sent this e-mail from another
email account).

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
