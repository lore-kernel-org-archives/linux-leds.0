Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0DCFC41513
	for <linux-leds@archiver.kernel.org>; Fri, 28 Jul 2023 09:03:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235054AbjG1JDH (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 28 Jul 2023 05:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235195AbjG1JCy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 Jul 2023 05:02:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4D24EC;
        Fri, 28 Jul 2023 02:02:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5262662085;
        Fri, 28 Jul 2023 09:02:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 202C2C433C8;
        Fri, 28 Jul 2023 09:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690534972;
        bh=F4MlZOcBpEKK00nFvTALje1M7bOaW3WRhlZHcwt1nao=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=t2sdqRkzZxjRGaZIzB/6N1dB4o3jIjD2eeKwFqjErhzXlraIdfxNGpnWTroScTPZY
         IhjYz9QULSkJsnlSvZ9MAcHjiCA2O1g8x5B75tc8AFyqT5aH9Fn2seZKDSCe0BZiHI
         pbCvUAIbFbfZYxPtXP0qdpymnATRcLRov6FoscGht+jP138WQvY3Ggx7xFWfA84bQg
         29YtZlWRz/yEuSmoEJLC3lblPnMvHRz5n82miq+Pjtpifxb3RZ2fsZ4Hx/75WphGee
         Jel02Ldy4v+cHIYQVXZFf2FsN65n90I7lofstPrgI6nYHElloeeOYsXl8HUeYLjuFG
         PHlw+2r3tV+Vg==
From:   Lee Jones <lee@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        Riku Voipio <riku.voipio@iki.fi>, Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20230714174651.4058753-1-robh@kernel.org>
References: <20230714174651.4058753-1-robh@kernel.org>
Subject: Re: (subset) [PATCH] leds: Explicitly include correct DT includes
Message-Id: <169053497081.290679.18222053479750049432.b4-ty@kernel.org>
Date:   Fri, 28 Jul 2023 10:02:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 14 Jul 2023 11:46:50 -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> [...]

Applied, thanks!

[1/1] leds: Explicitly include correct DT includes
      commit: 3192f141240336dd6d7675ff374757006fed1916

--
Lee Jones [李琼斯]

