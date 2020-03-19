Return-Path: <SRS0=DPGh=5E=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C7DC4332B
	for <linux-leds@archiver.kernel.org>; Thu, 19 Mar 2020 15:27:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C36F220658
	for <linux-leds@archiver.kernel.org>; Thu, 19 Mar 2020 15:27:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="DbBEJ0sr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727555AbgCSP1N (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 19 Mar 2020 11:27:13 -0400
Received: from lists.nic.cz ([217.31.204.67]:43806 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727402AbgCSP1N (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 19 Mar 2020 11:27:13 -0400
Received: from localhost (unknown [172.20.6.135])
        by mail.nic.cz (Postfix) with ESMTPSA id 6B64F141D51;
        Thu, 19 Mar 2020 16:27:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1584631631; bh=N6hRuIROdohj1Sq70ArYvLupyYboYCxcHLzYcpMLYJM=;
        h=Date:From:To;
        b=DbBEJ0srVeiBRJEHBXOUPbqxB+w8fUdCkw5k8bPfHajhtk3HIY/t4cjsf4PBsIWjw
         OTj0HtOQ/hBEiBjUIsC8kk5LggqQcNcLElpoX3rv85QdR5gspSMOzoocQgZbdwN72N
         WbBzzyxW5bIIOSpgYdZVIV6q08IGnTMN9E7goDSk=
Date:   Thu, 19 Mar 2020 16:27:10 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>
Subject: Re: turris omnia leds again: question
Message-ID: <20200319162710.1a458f50@nic.cz>
In-Reply-To: <325ae880-2325-e002-77e9-d853b84c6393@gmail.com>
References: <20200310183824.1e4ad91d@blackhole.sk>
        <8f481aa4-463c-30cc-df69-d1f630e848a2@gmail.com>
        <20200310232340.763cdaaa@blackhole.sk>
        <325ae880-2325-e002-77e9-d853b84c6393@gmail.com>
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

On Wed, 11 Mar 2020 11:59:07 +0100
Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:

> Device Tree will need to be changed to LED mc specific bindings,
> which at current state introduces one more level or nesting
> and LED_COLOR_ID_MULTI for the top level DT node.
> 
> And the driver will need to still support this approach as well
> as the new LED mc class.
> 

Hi Jacek,

I have used the led-sources in such a way that the user can either set
	led-sources = <0 1 2>;
	color = <LED_COLOR_ID_WHITE>;
in which case all three channels will be grouped into one led cdev,
or the user can use just one led-source, for example
	led-sources = <0>;
	color = <LED_COLOR_ID_RED>;
and in this case they can have one led cdev per channel.
Is this acceptable? Or should I just go with the WHITE approach?

In case that this is acceptable I wonder what should be the suggested
device-tree node naming and reg property, when using one led cdev per
channel, for example:
  led@1,0 {
	reg = <1>;
	led-sources = <3>;
	color = <LED_COLOR_ID_RED>;
  };
  led@1,1 {
	reg = <1>;
	led-sources = <4>;
	color = <LED_COLOR_ID_GREEN>;
  };
  led@1,2 {
	reg = <1>;
	led-sources = <5>;
	color = <LED_COLOR_ID_BLUE>;
  };
I don't think different nodes should have the same reg property. Should
in this case the reg property have two values?

Marek
