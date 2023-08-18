Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE97C001DE
	for <linux-leds@archiver.kernel.org>; Fri, 18 Aug 2023 10:44:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358648AbjHRKnl (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 18 Aug 2023 06:43:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358417AbjHRKn3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Aug 2023 06:43:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBF5726A8
        for <linux-leds@vger.kernel.org>; Fri, 18 Aug 2023 03:43:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 60F6567002
        for <linux-leds@vger.kernel.org>; Fri, 18 Aug 2023 10:43:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7E07C433C7;
        Fri, 18 Aug 2023 10:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692355405;
        bh=0h+HwZT5OxH45CmriKyqwz/HkZW8JuGBj9ICSw9xn0o=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=lpdYQQBvfMNuz49E0P3vHEnR+SC0oGndtDWcfMpeKF2ej5ZKs9YprHrXkXSpqWRTm
         oTiOieKQiOalUYPP1HWx0ri+Kxkr0/zHa4zSs2r4WidSRMtrpAa8ORL0zmY+oLnSgb
         oIaFUKYJh7roDNRWO6kRGy6XSgGlvm3amwNOzweAKIUxc3HoPq9xOd6ht1EzR2Fd2e
         bTmchNnMArrNOetVu1EIvFczCWVGg1FHjfCUKi50xlEU0HTU5Y6F4s1MR9gkhJHJxj
         JSafaCI7yE/kasnTvgwdSDX12INOZ0kebAh3kNb7g9AN9slz6KndzqjEBVTF7ovMw9
         uK6GedL9W0MRA==
From:   Lee Jones <lee@kernel.org>
To:     pavel@ucw.cz, lee@kernel.org, andrew@lunn.ch, ansuelsmth@gmail.com,
        davem@davemloft.net, kuba@kernel.org, dan.carpenter@linaro.org,
        Li Zetao <lizetao1@huawei.com>
Cc:     yang.lee@linux.alibaba.com, linux-leds@vger.kernel.org
In-Reply-To: <20230815075944.1089298-3-lizetao1@huawei.com>
References: <20230815075944.1089298-1-lizetao1@huawei.com>
 <20230815075944.1089298-3-lizetao1@huawei.com>
Subject: Re: (subset) [PATCH -next 2/2] leds: Use module_misc_device macro
 to simplify the code
Message-Id: <169235540353.1248638.6362058490989548432.b4-ty@kernel.org>
Date:   Fri, 18 Aug 2023 11:43:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 15 Aug 2023 15:59:44 +0800, Li Zetao wrote:
> Use the module_misc_device macro to simplify the code, which is the
> same as declaring with module_init() and module_exit().
> 
> 

Applied, thanks!

[2/2] leds: Use module_misc_device macro to simplify the code
      commit: a916d720ab5b4facd956fd2ec8332946f763cfbf

--
Lee Jones [李琼斯]

