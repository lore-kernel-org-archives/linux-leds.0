Return-Path: <SRS0=RXXv=C3=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CAABC43463
	for <linux-leds@archiver.kernel.org>; Fri, 18 Sep 2020 10:10:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 706A221D7B
	for <linux-leds@archiver.kernel.org>; Fri, 18 Sep 2020 10:10:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726456AbgIRKKK convert rfc822-to-8bit (ORCPT
        <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 18 Sep 2020 06:10:10 -0400
Received: from lists.nic.cz ([217.31.204.67]:33800 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725882AbgIRKKJ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 18 Sep 2020 06:10:09 -0400
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 2791B140A87;
        Fri, 18 Sep 2020 12:10:06 +0200 (CEST)
Date:   Fri, 18 Sep 2020 12:10:05 +0200
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
Message-ID: <20200918121005.1d805335@nic.cz>
In-Reply-To: <20200918095759.GG26842@paasikivi.fi.intel.com>
References: <20200917223338.14164-1-marek.behun@nic.cz>
        <20200917223338.14164-6-marek.behun@nic.cz>
        <20200918061500.GD26842@paasikivi.fi.intel.com>
        <20200918112058.6d3b0d5d@nic.cz>
        <20200918095759.GG26842@paasikivi.fi.intel.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 18 Sep 2020 12:57:59 +0300
Sakari Ailus <sakari.ailus@linux.intel.com> wrote:

> On Fri, Sep 18, 2020 at 11:20:58AM +0200, Marek Behun wrote:
> > On Fri, 18 Sep 2020 09:15:00 +0300
> > Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> >   
> > > Hi Marek,
> > > 
> > > On Fri, Sep 18, 2020 at 12:32:53AM +0200, Marek Behún wrote:  
> > > > Change
> > > >   .of_match_table = xxx,
> > > > to
> > > >   .of_match_table = of_match_ptr(xxx),
> > > > in various drivers.
> > > > 
> > > > This should be standard even for drivers that depend on OF.    
> > > 
> > > After this patch, none of these drivers will work on ACPI systems anymore.  
> 
> ^
> 
> If CONFIG_OF is disabled, that is.
> 
> > 
> > Hi Sakari,
> > 
> > I don't understand. Why not? Does ACPI subsystem parse of_match_table
> > as well?  
> 
> It does. The compatible string is used the same way as in DT for matching
> devices with "PRP0001" _HID or _CID.
> 
> Please read Documentation/firmware-guide/acpi/enumeration.rst .
> 
> IOW, you can safely do the above only for drivers that depend on OF in
> Kconfig. Otherwise you'll probably break something.
> 

Sakari, thank you for the pointer to the docs.
I thought that of_match_table is used only by OF (hence the name).

Marek
