Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C5E2C4332F
	for <linux-leds@archiver.kernel.org>; Mon,  6 Nov 2023 14:18:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbjKFOSn (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Mon, 6 Nov 2023 09:18:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbjKFOSm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 Nov 2023 09:18:42 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01DEADF
        for <linux-leds@vger.kernel.org>; Mon,  6 Nov 2023 06:18:40 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72DFDC433C7;
        Mon,  6 Nov 2023 14:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1699280319;
        bh=T1nxKa2tVsITuaXNIYi5R+mDkB+rrlSc8pmCbyOrF8g=;
        h=Date:From:To:Subject:From;
        b=MRD3vzEmYZiAOebMndcZKtbs/iUS/l13ZZxTiv0nCtPSfZx873O9ZuzY6Gn2eIL00
         wzqzTSGJ88K3Dy6hMvtqfRuboFNbpW1nmTYyJK6hxxtSgNn9sMuRaC0pQXt9QCab29
         xnsxwkKMhGjwHkBcxw9I/uMiKvUcJ8qO834IkJok=
Date:   Mon, 6 Nov 2023 09:18:38 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     linux-leds@vger.kernel.org
Subject: PSA: migrating linux-leds to new vger infrastructure
Message-ID: <20231106-elated-seahorse-of-research-2eb6bc@nitro>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Good day!

I plan to migrate the linux-leds@vger.kernel.org list to the new
infrastructure this week. We're still doing it list-by-list to make sure that
we don't run into scaling issues with the new infra.

The migration will be performed live and should not require any downtime.
There will be no changes to how anyone interacts with the list after
migration is completed, so no action is required on anyone's part.

Please let me know if you have any concerns.

Best wishes,
-K
