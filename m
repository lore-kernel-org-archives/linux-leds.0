Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67AAAC433EF
	for <linux-leds@archiver.kernel.org>; Thu,  2 Jun 2022 20:02:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234632AbiFBUCp (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 2 Jun 2022 16:02:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239084AbiFBUC3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 2 Jun 2022 16:02:29 -0400
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 02 Jun 2022 13:02:27 PDT
Received: from smtp687out9.mel.oss-core.net (smtp687out9.mel.oss-core.net [210.50.216.236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 79DE2E10
        for <linux-leds@vger.kernel.org>; Thu,  2 Jun 2022 13:02:26 -0700 (PDT)
X-IPAS-Result: =?us-ascii?q?A2C4SQDRFZli/7NplnpaGgEBAQEBDR4LBgEBAQECAgEBA?=
 =?us-ascii?q?QECAQEBAQMBAQEBAQsJCYFGAqV9hxkbgiWJYwsBAQEhMAQBAYR4AQFZBYRzJ?=
 =?us-ascii?q?jcGDgECBAEBAQEDAgMBAQEBAQEDAQEGAQEBAQEBBgSBHIUvRoZUIAcBgVYBD?=
 =?us-ascii?q?gEehXUBAaxugTMNdIRZFIIQBAqCc4E9AYlGhV99gRCBSBCCOAGFfYNAgi4Ek?=
 =?us-ascii?q?kaEIwQbOwMhFRg0EoEhRSwBCAYGBwoFMgYCDBgUBAITElMdAhIMChwOVBkMD?=
 =?us-ascii?q?wMSAxEBBwILEggVLAgDAgMIAwIDLgIDGAkHCgMdCAoKEhIQFAIEBg0eCwgDG?=
 =?us-ascii?q?R8tCQIEDgNDCAsKAxEEAxMYCxYIEAQGAwkvDSgLAxQPAQYDBgIFBQEDIAMUA?=
 =?us-ascii?q?wUnBwMhBwsmDQ0EIx0DAwUmAwICGwcCAgMCBhcGAgJxCigNCAQIBAwQHSUTB?=
 =?us-ascii?q?QIHMQUELwIeBAUGEQkCFgIGBAUCBAQWAgISCAIIJxsHFjYZAQUOTwYLCSEcC?=
 =?us-ascii?q?SARBQYWAyNzBUgPKTU5BnwPrlKQQJ4zCoNOBSkHgQkHnkkxg2MBlxIRASeBV?=
 =?us-ascii?q?4tUlmioEoEYgX9wFYIIgRxQKJ0QgRACBgsBAQMJjwoBAQ?=
IronPort-Data: A9a23:yLUBZ6ALmAviChVW/6Hhw5YqxClBgxIJ4kV8jS/XYbTApDp2hDwPz
 2NNWDvXMqncamT1eNkgPYvnoEwGvp/UndY3OVdlrnsFo1Bi95OZWYzxwmQcns+2BpeeJK6yx
 5xGMrEsFC2wJ5Pljk/F3oLJ9BGQ7onVAOulYAL4EnopH1U8Fn970UgLd9MR2+aEv/DoW2thh
 vuqyyHvEAfNN+lcaz98Bwqr8XuDjdyq0N8qlgVWicNj4Dcyo0Io4Kc3fsldGZdXrr58RYZWT
 86bpF2wE/iwEx0FUrtJmZ6jGqEGryK70QWm0hJrt6aebhdqlBMV7qcfHcgnTBl+yD+ivvVU7
 Y4cjMnlIespFvWkdOU1bDh+VgMhEoNq0pbgfCGd2SCR5xScKT21nq0oVRlre9RHq46bAkkXn
 RAcADELYBerguuwzKP9Qe5p7igmBJmxZN5B5So9pd3fJfY8YdPIfeLu3OBjwD0StPJvEKmHP
 tVMPFKDazyFOXWjIGw/DJM4gfftgnTzaBVGp1+P46k6+W7eyEp2yreFDTbOUoXQH4AMwx7d/
 zqbuj2mU1cBKNXZ1jCf9XugjObJkWX9VZ5UHaDQGuNWvWB/D1c7UHU+PWZXa9Hg4qJic7qz8
 3Apxxc=
IronPort-HdrOrdr: A9a23:op7076FevuzLkmmIpLqEi8eALOsnbusQ8zAXPidKJiC9E/b1qy
 nAppUmPHPP4wr5JktBpTnoAsDpfZq7z/BICOIqV4tKMjOKhFeV
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.91,272,1647262800"; 
   d="scan'208";a="82056735"
Received: from 122-150-105-179.sta.wbroadband.net.au (HELO WIN-J7GFDBAO51J) ([122.150.105.179])
  by smtp687.mel.oss-core.net with ESMTP; 03 Jun 2022 06:01:19 +1000
From:   "Martin Otamori" <info@mandy.com>
Subject: Acknowledge this message
To:     <linux-leds@vger.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Reply-To: <okkmart68@gmail.com>
Date:   Thu, 2 Jun 2022 13:01:15 -0700
Message-Id: <20220206130114FB03D0BB0A-9D5164E0A9@mandy.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

I will give you more details as soon as you acknowledge this message.
Thank you.
Martin Otamori.

