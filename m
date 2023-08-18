Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C493C7113D
	for <linux-leds@archiver.kernel.org>; Fri, 18 Aug 2023 07:44:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358190AbjHRHoI (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 18 Aug 2023 03:44:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353480AbjHRHnf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Aug 2023 03:43:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1098E30FE;
        Fri, 18 Aug 2023 00:43:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6E32D632B6;
        Fri, 18 Aug 2023 07:43:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93E2AC433CA;
        Fri, 18 Aug 2023 07:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692344612;
        bh=uIkyqAp4uBLl9WDF/1DU4t+pGT5SVGBfcri3yVMdClw=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=Oc3i7GC2R1fa1qipSwMVgCn/dWG1cw3xZmWt+oDAh1IuMUELTTZyCxz/7jcg5aJaZ
         owuosSzuk3dPiyhnsNVxV42FCGGnhdeO9ab4n7klJP/3gw8MWmpo4AfZzXA3VAc+58
         hAOyBH0qQZ9wdkAQGnjEGl1EwL78aWYq+b/xHTj/0kigF1MBDKywQrcP+rSUIcfIdl
         lRW1Qy9upa/KVXtjCHcEv6gFddFyxm+cGSIFQPBTrukVB6S2/bw/fLR3GFnC769ciC
         j9pQySWIRRUcAHOtO6K2Yi0mc62f9AmlHWpSuViFek7J4/xi1GHKqSbRB6S0TgLrEq
         b67vBivwq/LuQ==
From:   Lee Jones <lee@kernel.org>
To:     pavel@ucw.cz, lee@kernel.org, Ivan Orlov <ivan.orlov0322@gmail.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org
In-Reply-To: <20230810174905.7997-1-ivan.orlov0322@gmail.com>
References: <20230810174905.7997-1-ivan.orlov0322@gmail.com>
Subject: Re: (subset) [PATCH] leds: make leds_class a static const
 structure
Message-Id: <169234461129.1161430.17914576905328241154.b4-ty@kernel.org>
Date:   Fri, 18 Aug 2023 08:43:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 10 Aug 2023 21:49:05 +0400, Ivan Orlov wrote:
> Now that the driver core allows for struct class to be in read-only
> memory, move the leds_class structure to be declared at build time
> placing it into read-only memory, instead of having to be dynamically
> allocated at boot time.
> 
> 

Applied, thanks!

[1/1] leds: make leds_class a static const structure
      commit: 43a707ae58406200597b03a5be782e726b3c175b

--
Lee Jones [李琼斯]

