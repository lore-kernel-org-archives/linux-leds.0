Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A683BC433F5
	for <linux-leds@archiver.kernel.org>; Tue, 31 May 2022 21:50:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348171AbiEaVue (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 31 May 2022 17:50:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348187AbiEaVuc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 31 May 2022 17:50:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61C51985BD;
        Tue, 31 May 2022 14:50:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E95D56140D;
        Tue, 31 May 2022 21:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC5ACC3411E;
        Tue, 31 May 2022 21:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654033829;
        bh=wbfGaZu+kzb6bsHZK5Wwbw8M/EcpRU+lsLI3GfUOAmM=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=hmYSuKBdqf/1z2Km2+arETHoHT85LAc8OLl04B85iq6gaXM4HNRPugUKTWAcRlA23
         ZSW1Sx/yYmqubouq16Tu8mnT+orluqHjibTVA7jNpdto8+40o81d/tKf7P88NZsfMO
         1wKenPG+vJ1HkKCESyyT74aEDjySzyP6I/d1vxtzuuMlPRxyTAHu6Onlfnaw+EF3WT
         Z55fMHvfg9ETFH5EwHzdhJQaVKvglJ5o0IPxqHCR3rAxEedsyEDP8U4jEO7A+jAPoG
         xkThwqx56jmSPM7WZ6wkm82xzyWJh0ew88QukFqIn/MQThTvDvKYj1gEwBVWtkbnn0
         2kfzGxdTZDHEQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AA5F4F03944;
        Tue, 31 May 2022 21:50:29 +0000 (UTC)
Subject: Re: [GIT PULL] LEDs changes for v5.19-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20220531200619.GA8906@duo.ucw.cz>
References: <20220531200619.GA8906@duo.ucw.cz>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20220531200619.GA8906@duo.ucw.cz>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/leds-5.19-rc1
X-PR-Tracked-Commit-Id: e98a860f65428a3cae7ed7b3e8ebcf6320d7fc5e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2a5699b0de4ee623d77f183c8e8e62691bd60a70
Message-Id: <165403382969.9010.2181576077677536467.pr-tracker-bot@kernel.org>
Date:   Tue, 31 May 2022 21:50:29 +0000
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The pull request you sent on Tue, 31 May 2022 22:06:19 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/leds-5.19-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2a5699b0de4ee623d77f183c8e8e62691bd60a70

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
