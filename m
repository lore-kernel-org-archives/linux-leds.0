Return-Path: <SRS0=SVrG=C2=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 987FAC433E2
	for <linux-leds@archiver.kernel.org>; Thu, 17 Sep 2020 15:39:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E30722210
	for <linux-leds@archiver.kernel.org>; Thu, 17 Sep 2020 15:39:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728165AbgIQPYj convert rfc822-to-8bit (ORCPT
        <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 17 Sep 2020 11:24:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728151AbgIQPYR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Sep 2020 11:24:17 -0400
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 838DAC06174A;
        Thu, 17 Sep 2020 08:24:16 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 81A2F140A6F;
        Thu, 17 Sep 2020 17:24:04 +0200 (CEST)
Date:   Thu, 17 Sep 2020 17:24:04 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     <linux-leds@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?B?T25kxZllag==?= Jirman <megous@megous.com>,
        <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH leds v1 03/10] leds: lm3697: use struct led_init_data
 when registering
Message-ID: <20200917172404.68c0b19a@nic.cz>
In-Reply-To: <a8db8039-3ce3-2669-4287-04585fcc17a1@ti.com>
References: <20200916231650.11484-1-marek.behun@nic.cz>
        <20200916231650.11484-4-marek.behun@nic.cz>
        <a8db8039-3ce3-2669-4287-04585fcc17a1@ti.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 17 Sep 2020 06:39:56 -0500
Dan Murphy <dmurphy@ti.com> wrote:

> Marek
> 
> On 9/16/20 6:16 PM, Marek Behún wrote:
> > By using struct led_init_data when registering we do not need to parse
> > `label` DT property nor `linux,default-trigger` property.  
> 
> I would prefer 2 separate patches. One implementing the init_data and 
> the other removing the default trigger
> 
> Dan
> 
> 

Am working on it :)
