From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 0/2 v2] leds: tlc591xx: add missing of_node_put
Date: Sat, 15 Jul 2017 11:58:17 +0200
Message-ID: <1500112699-770-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:41719
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751156AbdGOKXT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Sat, 15 Jul 2017 06:23:19 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>
Cc: kernel-janitors@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

This series first merges two conditionals and then adds of_node_put on
jumping out of for_each_child_of_node.

v2 adds the merge of conditionals, resulting in fewer of_node_put calls.
