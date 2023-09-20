Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E30CE79D1
	for <linux-leds@archiver.kernel.org>; Wed, 20 Sep 2023 13:48:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234961AbjITNsk (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 20 Sep 2023 09:48:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234996AbjITNsi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 20 Sep 2023 09:48:38 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5290D9
        for <linux-leds@vger.kernel.org>; Wed, 20 Sep 2023 06:48:29 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F93C433C7;
        Wed, 20 Sep 2023 13:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695217709;
        bh=lb+x07hlo2cz3JFK+XVatMaU4UEuHZxj4rF4v4Q1aQ4=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=YIfcpIhnVqaFNxkbz1MGt9dMUOHmDqi81Fw8+P14EgU6NFDD6PnjhSn7H6r44mfaS
         HpL1qxNZMH2lJo5pC2erpT2dJMARFPzJe/WhxATN9go4UGsVUfyRFmJPZpuNiCxivW
         NeIlEWL93GycbiWpXBlzS2Ti6FQ4IW6Ir269+ONHKyV/+e1ire9e7t24R3JZDzSMlr
         D3nPbjcP91Oi7Vr6s1/AGYgyp++08YexTUiPbN3fO1HwDxBstIm8Hpml3+u8nbZsXV
         kQmW414HAVKpiaOG4Wt5LTEJUiOxwBN3cKMUNPxFBgnRM3E6nB8aO4nMB8miE+ir1R
         evbRTR1wasHLA==
From:   Lee Jones <lee@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-leds@vger.kernel.org,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Xing Tong Wu <xingtong.wu@siemens.com>,
        Tobias Schaffner <tobias.schaffner@siemens.com>,
        Henning Schild <henning.schild@siemens.com>,
        kernel@pengutronix.de, Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230916164516.1063380-1-u.kleine-koenig@pengutronix.de>
References: <20230916164516.1063380-1-u.kleine-koenig@pengutronix.de>
Subject: Re: (subset) [PATCH v2] leds: simatic-ipc-leds-gpio: Convert to
 platform remove callback returning void
Message-Id: <169521770737.3447233.13285439111674870237.b4-ty@kernel.org>
Date:   Wed, 20 Sep 2023 14:48:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, 16 Sep 2023 18:45:16 +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> [...]

Applied, thanks!

[1/1] leds: simatic-ipc-leds-gpio: Convert to platform remove callback returning void
      commit: 5af618bb43581f2c7d1bdfe8b769a2c85025854e

--
Lee Jones [李琼斯]

