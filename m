Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4437AC433E9
	for <linux-leds@archiver.kernel.org>; Fri, 26 Feb 2021 22:25:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0ADD264F99
	for <linux-leds@archiver.kernel.org>; Fri, 26 Feb 2021 22:25:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbhBZWYt (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 26 Feb 2021 17:24:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:56118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230079AbhBZWYp (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 26 Feb 2021 17:24:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 5DD3A64F0D;
        Fri, 26 Feb 2021 22:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614378245;
        bh=VaogzizxXSQRtwJw1meIVXAgOY7lybDpeSU5HRgo6U8=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=G9MpJxxpbtod5UI+eVSV+yete0FxtwkGxehGeZ7Th8/9qBeEaKISGbwXfq8xeDLhg
         P1NbKjDZn+U5EutgvkyqF9cS0BrMtsd3mq0/6hTGAgVhfQ6YLvZFJm4pjl+4d8ZbCL
         4YGDDPV7i8Yq6Upg8ow8vqt+LohQIcc7q6nBSXUQfT7Q/QLkVkWEhKXoLwqZ+bqYG/
         4Sn2cSVQjvkV10NoQpHQkUtvrBis847ePHKsWomxt0OZ0yYJjopxzoft0z4+rZCpuK
         Djowc3AMR+YothBzi3BshkKD/2U14heJ2M9yGE5xW3/MyHjaggzwo8awyJczcetrd2
         usNMvofZKa7Ww==
Subject: Re: [GIT PULL] LEDs changes for 5.12-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210226121848.GA20159@duo.ucw.cz>
References: <20210226121848.GA20159@duo.ucw.cz>
X-PR-Tracked-List-Id: <linux-leds.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210226121848.GA20159@duo.ucw.cz>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/leds-5.12-rc1
X-PR-Tracked-Commit-Id: b0a82efa51ad3ba1117817817cbabe9c9a37b893
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fecfd015394e9151f535d675e115fba967bddb3f
Message-Id: <161437824536.23821.15349018126565499879.pr-tracker-bot@kernel.org>
Date:   Fri, 26 Feb 2021 22:24:05 +0000
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The pull request you sent on Fri, 26 Feb 2021 13:18:48 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/leds-5.12-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fecfd015394e9151f535d675e115fba967bddb3f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
