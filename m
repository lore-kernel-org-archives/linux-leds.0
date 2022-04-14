Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE5FC433EF
	for <linux-leds@archiver.kernel.org>; Thu, 14 Apr 2022 07:14:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240284AbiDNHQ0 (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 14 Apr 2022 03:16:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240282AbiDNHQ0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 14 Apr 2022 03:16:26 -0400
Received: from mail.thorsis.com (mail.thorsis.com [92.198.35.195])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9579E15A24;
        Thu, 14 Apr 2022 00:14:02 -0700 (PDT)
Date:   Thu, 14 Apr 2022 09:13:56 +0200
From:   Alexander Dahl <ada@thorsis.com>
To:     Velumani T <velumani.t@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, patrick@stwcx.xyz
Subject: Re: Multi-color LED framework
Message-ID: <YlfJtC3oXmFNjUus@ada.ifak-system.com>
Mail-Followup-To: Velumani T <velumani.t@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, patrick@stwcx.xyz
References: <CAEHFT+o-wv=5AUrzwYDR5t4fA4vDJW8QY2SCpteNYrq6nYB2ZQ@mail.gmail.com>
 <CAEHFT+rq_Pn9Y+38ZBptCDpEUUtKL5RYGUh2gmySXtjQefLG8g@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEHFT+rq_Pn9Y+38ZBptCDpEUUtKL5RYGUh2gmySXtjQefLG8g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Velu,

Am Wed, Apr 13, 2022 at 10:54:17PM +0530 schrieb Velumani T:
> Hi All,
> 
> I have a question about the multi-color LED driver, Is the multicolor
> driver implementation specific to the RGB color integration?

Not sure what you mean, but I think no.

> If yes, is there a way I can use static color LEDs with this driver
> framework making changes to have this as enhancement?
> 
> In my case we have blue and yellow color static LEDs connected in
> GPIO, I need to choose the color from the application and the LED
> shall glow based on the application configuration.

Is that two colors in one package?

Anyways, the request for a multicolor gpio led driver hit the list a
few times in the past, but AFAIK no one stepped forward with actual
patches.  If you have something, just throw it on the list, if it's
not in perfect shape, maybe as RFC.  I think that would be highly
appreciated by other users. :-)

Greets
Alex
