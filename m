Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E97C433DB
	for <linux-leds@archiver.kernel.org>; Sun, 14 Feb 2021 20:59:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F21464E2C
	for <linux-leds@archiver.kernel.org>; Sun, 14 Feb 2021 20:59:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229969AbhBNU72 (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sun, 14 Feb 2021 15:59:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:50676 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229935AbhBNU71 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 14 Feb 2021 15:59:27 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id B573F64E4E;
        Sun, 14 Feb 2021 20:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613336326;
        bh=8bUdXuZuWAQIT5Kom7OKGmPPUQ+ugfoqxtA6QU3Q+2U=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=it7uy/TGrDfHE/Lk8dowJDM9RmIj4iDWRD+wtRASUZeDQ1qHjqxnoG3mYppBNFkJz
         oLfsQGIeQODIjZjW3ABrZWeYp8SL5WsahG+X9qICOT3ej8PAUSMhHPubBSP5WLnmtB
         CdI28aecTP22XXSZZEPl0DpifostqDHTITK5sA5SZrmU6/FmhI5iTJwyTUqTN9dUrw
         agnyiCmti59xI4VFp+sMQ/JHG7W6d3C0QDiSiQHf/lZe9x3VOlWtJzMySczxAFjoJG
         N8pDkiunqoX3ZeXjc87BFFSv9ArexfxwQXfkIicLsHWnsjSRpqoS4DYpnOgcqs/CLA
         Jw/vXFCHweQMg==
Subject: Re: [GIT PULL 5.11-rc8] LED fix
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210214171328.GA5314@duo.ucw.cz>
References: <20210214171328.GA5314@duo.ucw.cz>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210214171328.GA5314@duo.ucw.cz>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ for-rc8-5.11
X-PR-Tracked-Commit-Id: dbeb02a0bc41b9e9b9c05e460890351efecf1352
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 28a17338738839494752c5da3e12c889a55219db
Message-Id: <161333632666.25612.17400157940923623653.pr-tracker-bot@kernel.org>
Date:   Sun, 14 Feb 2021 20:58:46 +0000
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The pull request you sent on Sun, 14 Feb 2021 18:13:28 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ for-rc8-5.11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/28a17338738839494752c5da3e12c889a55219db

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
