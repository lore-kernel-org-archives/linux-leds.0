Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD57CDB47E
	for <linux-leds@archiver.kernel.org>; Thu, 12 Oct 2023 09:33:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235507AbjJLJdj (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 12 Oct 2023 05:33:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234163AbjJLJdi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 12 Oct 2023 05:33:38 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CE92B8;
        Thu, 12 Oct 2023 02:33:37 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D345DC433C7;
        Thu, 12 Oct 2023 09:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697103216;
        bh=vkw5mVXnujsJCmcHXN4lVw43ytuHy7CU66wGAb5wVnY=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=p6LqcTeEUhVX/CCr3WiIjZMeXgN3/GdKFvK+L4YIAC1J1/PyBQ/3VAFztzJeDOZZH
         6J0qd/Vg25hoSKLPLIBbnfBuMOu1a1AgDVD/xd8KbPFoAKqPdNnXF+PcRxU9pm1ccn
         OfNetsw9pZ6lZngod3e1g3jhCX37urfcoBDX8UX5aPyaZ9p01fSZSMHZzIbi548NSU
         xjMGQ9MZtbLwVtxYG6lqzaiGOgf8ZhkH4ogzqy/70sovlxIQr8rWkg7CBSQ9u8XZVY
         AkA1iac/QD2I88Gk7nCLSzFTKmmh0oM/vxYl+Iog2Lw1Zqd9VwioL5hbrvWKelaGGE
         d92sbLxFwZwsQ==
From:   Lee Jones <lee@kernel.org>
To:     linux-kernel@vger.kernel.org,
        =?utf-8?q?Ond=C5=99ej_Jirman?= <megi@xff.cz>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20231008142103.1174028-1-megi@xff.cz>
References: <20231008142103.1174028-1-megi@xff.cz>
Subject: Re: [PATCH] dt-bindings: leds: Last color id is now 14
 (LED_COLOR_ID_LIME)
Message-Id: <169710321458.1152368.1169129678773740373.b4-ty@kernel.org>
Date:   Thu, 12 Oct 2023 10:33:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, 08 Oct 2023 16:21:00 +0200, Ondřej Jirman wrote:
> Increase the limit to match available values in dt-bindings/leds/common.h
> 
> 

Applied, thanks!

[1/1] dt-bindings: leds: Last color id is now 14 (LED_COLOR_ID_LIME)
      commit: fdb7bb34af8b063b5a8bb1290af4252c38d935ea

--
Lee Jones [李琼斯]

