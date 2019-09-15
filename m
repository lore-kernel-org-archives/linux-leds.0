Return-Path: <SRS0=Wg+r=XK=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C56EC4CECC
	for <linux-leds@archiver.kernel.org>; Sun, 15 Sep 2019 16:52:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1BB8A214D8
	for <linux-leds@archiver.kernel.org>; Sun, 15 Sep 2019 16:52:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbfIOQwd (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sun, 15 Sep 2019 12:52:33 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:54677 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726484AbfIOQwd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 15 Sep 2019 12:52:33 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 4D90581DFC; Sun, 15 Sep 2019 18:52:18 +0200 (CEST)
Date:   Sun, 15 Sep 2019 18:52:24 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Daniel Mack <daniel@zonque.org>
Cc:     jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Subject: Re: [PATCH] drivers: leds: tlc591xx: check error during device init
Message-ID: <20190915165224.GB4857@bug>
References: <20190913180749.25740-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190913180749.25740-1-daniel@zonque.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri 2019-09-13 20:07:49, Daniel Mack wrote:
> The driver currently ignores errors from register writes at probe time.
> It will hence register an LED class device no matter whether the
> pyhsical device is present or not.
> 
> To fix this, make the device probe fail in case regmap operations
> return an error.
> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>

Acked-by: Pavel Machek <pavel@ucw.cz>

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
