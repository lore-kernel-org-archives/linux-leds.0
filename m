Return-Path: <SRS0=RXXv=C3=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D047C43464
	for <linux-leds@archiver.kernel.org>; Fri, 18 Sep 2020 17:22:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34DF521707
	for <linux-leds@archiver.kernel.org>; Fri, 18 Sep 2020 17:22:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbgIRRWc (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 18 Sep 2020 13:22:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbgIRRW2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Sep 2020 13:22:28 -0400
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D469C0613CE;
        Fri, 18 Sep 2020 10:22:28 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id D51AF140925;
        Fri, 18 Sep 2020 19:22:26 +0200 (CEST)
Date:   Fri, 18 Sep 2020 19:22:26 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     <linux-leds@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?B?T25kxZllag==?= Jirman <megous@megous.com>,
        <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH leds v2 15/50] leds: lm3697: cosmetic change: use helper
 variable, reverse christmas tree
Message-ID: <20200918192226.43f28370@nic.cz>
In-Reply-To: <7d91fc92-0b56-afd6-a948-c25be9bfed38@ti.com>
References: <20200917223338.14164-1-marek.behun@nic.cz>
        <20200917223338.14164-16-marek.behun@nic.cz>
        <7d91fc92-0b56-afd6-a948-c25be9bfed38@ti.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 18 Sep 2020 06:47:20 -0500
Dan Murphy <dmurphy@ti.com> wrote:

> 
> Reviewed-by: Dan Murphy <dmurphy@ti.com>
> 
> 

Dan,

could you also review patch 14/50? That one is also lm3697 and this one
depends on it.

Marek
