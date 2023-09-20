Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 770A2CE79D0
	for <linux-leds@archiver.kernel.org>; Wed, 20 Sep 2023 13:36:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234564AbjITNgM (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 20 Sep 2023 09:36:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234686AbjITNgL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 20 Sep 2023 09:36:11 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BEC19E;
        Wed, 20 Sep 2023 06:36:06 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C18C1C433C7;
        Wed, 20 Sep 2023 13:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695216965;
        bh=ZxkDaX0Z2lxf8j4cvuVarbFGbN+WP1U04C+ayh/pOro=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=RFeQnBCv2wx9+qW//lEh5zRLWduWtBK1fhB1YMNTtVOA55nrez/NvJrThIFR1veat
         kWzWF3o0x9wi17/xFQLD/E603t1PafK67N4FCqaim8Xwo8JIP/EJTxKUiPGc589TzS
         HRPLFFCZGSri9Cs+20bB7rM1IsWdvBiQcdhHqXTXv0RVZSq9LzweX23GOSwqTnlrNC
         0wL0y+JSF7qFHb81eaRHi0fhsE3QN/evL9IpjWPd/mgB+p3VA4PpZvxds1NdfBEwgP
         5dHBc9S8pf8whTX3YBI+KJRxknwF1dmCKoT3TU5hAj9ji33RTr7lPmXhgq4teHCGas
         T5hmYA+oRF0aA==
From:   Lee Jones <lee@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Kees Cook <keescook@chromium.org>
Cc:     Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
In-Reply-To: <20230915200948.never.728-kees@kernel.org>
References: <20230915200948.never.728-kees@kernel.org>
Subject: Re: (subset) [PATCH] leds: cr0014114: Annotate struct cr0014114
 with __counted_by
Message-Id: <169521696355.3440140.11697535957050657885.b4-ty@kernel.org>
Date:   Wed, 20 Sep 2023 14:36:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 15 Sep 2023 13:09:48 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct cr0014114.
> 
> [...]

Applied, thanks!

[1/1] leds: cr0014114: Annotate struct cr0014114 with __counted_by
      commit: dfd75548c30c4a27bcc4c81aed0287d2e8b62add

--
Lee Jones [李琼斯]

