Return-Path: <SRS0=RXXv=C3=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9808C43464
	for <linux-leds@archiver.kernel.org>; Fri, 18 Sep 2020 09:21:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5274720771
	for <linux-leds@archiver.kernel.org>; Fri, 18 Sep 2020 09:21:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgIRJVC convert rfc822-to-8bit (ORCPT
        <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 18 Sep 2020 05:21:02 -0400
Received: from mail.nic.cz ([217.31.204.67]:37652 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725874AbgIRJVB (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 18 Sep 2020 05:21:01 -0400
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id AC71F140A6D;
        Fri, 18 Sep 2020 11:20:58 +0200 (CEST)
Date:   Fri, 18 Sep 2020 11:20:58 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?B?T25kxZllag==?= Jirman <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH leds v2 05/50] leds: various: guard of_match_table
 member value with of_match_ptr
Message-ID: <20200918112058.6d3b0d5d@nic.cz>
In-Reply-To: <20200918061500.GD26842@paasikivi.fi.intel.com>
References: <20200917223338.14164-1-marek.behun@nic.cz>
        <20200917223338.14164-6-marek.behun@nic.cz>
        <20200918061500.GD26842@paasikivi.fi.intel.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 18 Sep 2020 09:15:00 +0300
Sakari Ailus <sakari.ailus@linux.intel.com> wrote:

> Hi Marek,
> 
> On Fri, Sep 18, 2020 at 12:32:53AM +0200, Marek Behún wrote:
> > Change
> >   .of_match_table = xxx,
> > to
> >   .of_match_table = of_match_ptr(xxx),
> > in various drivers.
> > 
> > This should be standard even for drivers that depend on OF.  
> 
> After this patch, none of these drivers will work on ACPI systems anymore.

Hi Sakari,

I don't understand. Why not? Does ACPI subsystem parse of_match_table
as well?

