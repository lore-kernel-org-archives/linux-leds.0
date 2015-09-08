From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] leds: syscon: Correct check for syscon_node_to_regmap()
 errors
Date: Tue, 8 Sep 2015 10:43:49 +0200
Message-ID: <CACRpkdYKZ5BURZhnQgWCQFFqcbcYd+Qem0NPjB6yP98YJzGKTQ@mail.gmail.com>
References: <1439925926-3174-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:36562 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751658AbbIHInu (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 8 Sep 2015 04:43:50 -0400
Received: by obqa2 with SMTP id a2so77621137obq.3
        for <linux-leds@vger.kernel.org>; Tue, 08 Sep 2015 01:43:49 -0700 (PDT)
In-Reply-To: <1439925926-3174-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Aug 18, 2015 at 9:25 PM, Bjorn Andersson
<bjorn.andersson@sonymobile.com> wrote:

> syscon_node_to_regmap() returns a regmap or an ERR_PTR().
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> ---
>
> Changes since v1:
> - Propagate the error

Too late but:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
