Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F986C001B0
	for <linux-leds@archiver.kernel.org>; Thu, 13 Jul 2023 15:42:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbjGMPmn (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 13 Jul 2023 11:42:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229922AbjGMPmm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 13 Jul 2023 11:42:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2251B2680;
        Thu, 13 Jul 2023 08:42:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A93E2617F1;
        Thu, 13 Jul 2023 15:42:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC99C433C7;
        Thu, 13 Jul 2023 15:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689262961;
        bh=jS3hPdq523+QgNVWU8vvY1rzkmpHFQq5jsrVKZqsnM8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DBTCSh/zL9Yfc6McfWwTCSAChw7SaL7to4nWJp28cPi9bZ6Mtdb9Vo8LxsoNJC/aB
         pvrG1stmZeYSTuF3aUlh5AAglxecizvAL3zjAxeXS6qcfdZP4+sMp+aKI8MVnd+Zdr
         44zO4xx8dg6eVtGqmxY/dCXdAawOWzei2K4yPKfAL2hgd4q2A3EP5ICIVcezNVT1Zc
         kMKzJguo2ArulBrXI3J4ttCFTUvkCTavr0+u0zrpNBeGF2+hLBGAXgHSHSqweSvd6v
         zW+U9ff+dhsykv2otMK29ndfFU0R//vueLMtHS0QsAWLI3Aq78q66VdE+pgufctUSn
         0RskzxlHTFCrw==
Date:   Thu, 13 Jul 2023 16:42:36 +0100
From:   Lee Jones <lee@kernel.org>
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: simatic-ipc-leds-gpio: fix comment style in
 SPDX header
Message-ID: <20230713154236.GF968624@google.com>
References: <20230706161040.21152-1-henning.schild@siemens.com>
 <20230706161040.21152-3-henning.schild@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230706161040.21152-3-henning.schild@siemens.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 06 Jul 2023, Henning Schild wrote:

> This was found with giving the file to checkpatch.
> 
> Signed-off-by: Henning Schild <henning.schild@siemens.com>
> ---
>  drivers/leds/simple/simatic-ipc-leds-gpio.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
