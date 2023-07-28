Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D945C001DE
	for <linux-leds@archiver.kernel.org>; Fri, 28 Jul 2023 10:58:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235730AbjG1K6e (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 28 Jul 2023 06:58:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233775AbjG1K6d (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 Jul 2023 06:58:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E48BF26BC;
        Fri, 28 Jul 2023 03:58:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7DD40620D2;
        Fri, 28 Jul 2023 10:58:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E165C433C8;
        Fri, 28 Jul 2023 10:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690541911;
        bh=+wxnkCG035cpz9797wtipinXz8iWGwKy9GAM68TlIKw=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=mzld1Yt5Hznwt0XDf12iVnvQb0PDvvB6RRFiWtX8s67N+7jh7+fgq+EkkZl8fSGrl
         H8yaaelyf69kNAJCSqP3O39wj/AjD5FWDCYDZzGPAjf/SV8mflxrm2fOsL/zC0TPk7
         8CtJ48UcXMl06fA7CKU8x3uZVzMp8HbGSZ1SHo4eZQpMWDfM0oOC7mStangOxIjyyN
         RSf9o8w0n3c8kO7NM3CFpufcYCAURRH+IpFomStcW8PvBdb9DiuyMUS+aDEjsOqjqL
         J//KFJTyj5aLuvJao0JDqJZegAvT7dh3XYTjT4mOe4FnoqS6GcBsv5zAFF1yaDXvyx
         v11HY139s/mIA==
From:   Lee Jones <lee@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-leds@vger.kernel.org
In-Reply-To: <560b8f140c19a7da40f5e9540c3ef312969b0dc4.1690057595.git.christophe.jaillet@wanadoo.fr>
References: <560b8f140c19a7da40f5e9540c3ef312969b0dc4.1690057595.git.christophe.jaillet@wanadoo.fr>
Subject: Re: (subset) [PATCH] leds: ns2: Slightly simplify a memory
 allocation
Message-Id: <169054191038.338256.14267674740250661120.b4-ty@kernel.org>
Date:   Fri, 28 Jul 2023 11:58:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, 22 Jul 2023 22:26:49 +0200, Christophe JAILLET wrote:
> Use devm_kcalloc() instead of devm_kzalloc()+array_size().
> 
> 

Applied, thanks!

[1/1] leds: ns2: Slightly simplify a memory allocation
      commit: c8a039436525072af7e77f540d21f0d312fc7c38

--
Lee Jones [李琼斯]

