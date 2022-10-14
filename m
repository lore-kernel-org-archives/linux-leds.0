Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EBE7C4332F
	for <linux-leds@archiver.kernel.org>; Fri, 14 Oct 2022 20:24:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231451AbiJNUYn (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 14 Oct 2022 16:24:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231437AbiJNUYm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 14 Oct 2022 16:24:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 126FC10A3;
        Fri, 14 Oct 2022 13:24:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A2B1661C39;
        Fri, 14 Oct 2022 20:24:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F077C433D7;
        Fri, 14 Oct 2022 20:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665779076;
        bh=iBw48xc88q8vxtjMNWaiqIZCnQw4RPGJLqZOZo0RzJ8=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=prccdttfBEqd5XIJE64FtakVm64ORWLgJg7xdA6TbU0NMkjj3p39n4xUZVMNVeyBH
         hCfSIhRpBxaUu1STiwZ/Eh4xSUf6r15XZ3ehMlWYDGhmnFLUhryulmEYGxE9sobp8x
         8katuQ5pPPSWtUg1wAP9sEblA3ddEqMXVdwP2IdKzYQEFwd3ZZoPvzpsheO2NLClqe
         05InH5L/B9awCyZri3nRJhbYIC8v37eVJk1h+Sg0U0u7yVWp0hcMGhNQYTjIF9GY5j
         scBtL/37456om82PlQ5cnATi9EMDZ77TtJjP/H44/+49vECSDurylQexUoigAUB3CZ
         pDyDj6c0uOIdg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F0057E4D00A;
        Fri, 14 Oct 2022 20:24:35 +0000 (UTC)
Subject: Re: [GIT PULL] LEDs changes for v6.1-rc
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20221014130544.GA10424@duo.ucw.cz>
References: <20221014130544.GA10424@duo.ucw.cz>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20221014130544.GA10424@duo.ucw.cz>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/leds-6.1-rc1
X-PR-Tracked-Commit-Id: 4d1632151bde847230a0bd2318806380d309655f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5964c927b4c1399bd3ab80ebaa62eb6eef96ab07
Message-Id: <166577907597.10237.3147436740270858066.pr-tracker-bot@kernel.org>
Date:   Fri, 14 Oct 2022 20:24:35 +0000
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The pull request you sent on Fri, 14 Oct 2022 15:05:44 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/leds-6.1-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5964c927b4c1399bd3ab80ebaa62eb6eef96ab07

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
