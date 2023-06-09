Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F0B8C7EE25
	for <linux-leds@archiver.kernel.org>; Fri,  9 Jun 2023 06:45:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbjFIGpN (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:45:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238488AbjFIGob (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 9 Jun 2023 02:44:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ABE83583;
        Thu,  8 Jun 2023 23:44:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 90AA065415;
        Fri,  9 Jun 2023 06:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A96CBC4339C;
        Fri,  9 Jun 2023 06:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686293070;
        bh=QyOA5/IKmTntEVE1tyalD9Wad44vUaRA8tr+u7vrsbs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G8tUf3xMdSugvOvzQMRTRa0h9zZlHTJhQK6qLjYJYHYxlaUkDtJi/s7U01wUqR4A7
         LQaIUus55Boxisw62dvMq31OhkEluqpKrCtIcI21FgNIcdOi8jWs57H3xuvlHXIGOU
         uyMyX37LNNCUrr/AIojdqzWdpz3Rv/y0BfPBY+piD0bJ7kikDl3wWJInQT4Bxmiqz7
         MuCqUXMFyy6AYfT1wfvOKwBGvD3R8F6TMaNsVL33Nqr8qdy+2PSPCJvTfgGbknCjLG
         VxzqPFIWKrWm6ACXVb1pMf1wiyRRAXZNzosSRRjoEXu32l0tJAjJYMKlQrlCdWPZUz
         Nb8YgoCJ0W4Rw==
Date:   Fri, 9 Jun 2023 07:44:24 +0100
From:   Lee Jones <lee@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     pavel@ucw.cz, sean.wang@mediatek.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
Subject: Re: [PATCH v3 8/8] leds: leds-mt6323: Add support for WLEDs and
 MT6332
Message-ID: <20230609064424.GK3635807@google.com>
References: <20230601110813.2373764-1-angelogioacchino.delregno@collabora.com>
 <20230601110813.2373764-9-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230601110813.2373764-9-angelogioacchino.delregno@collabora.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 01 Jun 2023, AngeloGioacchino Del Regno wrote:

> Add basic code to turn on and off WLEDs and wire up MT6332 support
> to take advantage of it.
> This is a simple approach due to the aforementioned PMIC supporting
> only on/off status so, at the time of writing, it is impossible for me
> to validate more advanced functionality due to lack of hardware.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/leds/leds-mt6323.c | 171 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 164 insertions(+), 7 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
