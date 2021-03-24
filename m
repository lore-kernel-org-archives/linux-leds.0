Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 311A1C433E1
	for <linux-leds@archiver.kernel.org>; Wed, 24 Mar 2021 09:43:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E951161A0B
	for <linux-leds@archiver.kernel.org>; Wed, 24 Mar 2021 09:43:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232788AbhCXJmp (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 24 Mar 2021 05:42:45 -0400
Received: from lists.nic.cz ([217.31.204.67]:59496 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232702AbhCXJm3 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 24 Mar 2021 05:42:29 -0400
Received: from thinkpad (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id C415C1409C3;
        Wed, 24 Mar 2021 10:42:27 +0100 (CET)
Date:   Wed, 24 Mar 2021 10:42:26 +0000
From:   Marek Behun <marek.behun@nic.cz>
To:     Hermes Zhang <chenhui.zhang@axis.com>
Cc:     <pavel@ucw.cz>, <dmurphy@ti.com>, <robh+dt@kernel.org>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <chenhuiz@axis.com>,
        <lkml@axis.com>, <kernel@axis.com>
Subject: Re: [PATCH 0/2] New multiple GPIOs LED driver
Message-ID: <20210324104226.50ea66e6@thinkpad>
In-Reply-To: <20210324075631.5004-1-chenhui.zhang@axis.com>
References: <20210324075631.5004-1-chenhui.zhang@axis.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 24 Mar 2021 15:56:29 +0800
Hermes Zhang <chenhui.zhang@axis.com> wrote:

> From: Hermes Zhang <chenhuiz@axis.com>
> 
> *** BLURB HERE ***

"*** BLURB HERE ***" is meant to be substituted with your text :)

All in all I think you are adding functionality which can be
incorporated simply into the existing leds-gpio driver instead of new
driver.

Marek
