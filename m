Return-Path: <SRS0=48XR=C4=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2979C43463
	for <linux-leds@archiver.kernel.org>; Sat, 19 Sep 2020 18:05:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D5AE2068E
	for <linux-leds@archiver.kernel.org>; Sat, 19 Sep 2020 18:05:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbgISSFa convert rfc822-to-8bit (ORCPT
        <rfc822;linux-leds@archiver.kernel.org>);
        Sat, 19 Sep 2020 14:05:30 -0400
Received: from lists.nic.cz ([217.31.204.67]:53084 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726449AbgISSF3 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 19 Sep 2020 14:05:29 -0400
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 858E41409FE;
        Sat, 19 Sep 2020 20:05:27 +0200 (CEST)
Date:   Sat, 19 Sep 2020 20:05:27 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Alexander Dahl <post@lespocky.de>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Alexander Dahl <ada@thorsis.com>,
        Denis Osterland-Heim <denis.osterland@diehl.com>
Subject: Re: [PATCH v5 1/3] leds: pwm: Remove platform_data support
Message-ID: <20200919200527.70638a27@nic.cz>
In-Reply-To: <20200919053145.7564-2-post@lespocky.de>
References: <20200919053145.7564-1-post@lespocky.de>
        <20200919053145.7564-2-post@lespocky.de>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Besides Pavel's note about the __attribute__((nonnull)) position

Reviewed-by: Marek Behún <marek.behun@nic.cz>
