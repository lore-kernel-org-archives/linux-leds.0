Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC28CC7EE26
	for <linux-leds@archiver.kernel.org>; Tue, 23 May 2023 17:21:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233049AbjEWRVm (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 23 May 2023 13:21:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237340AbjEWRVk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 23 May 2023 13:21:40 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D16A5E4B
        for <linux-leds@vger.kernel.org>; Tue, 23 May 2023 10:21:19 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-51b4ef5378bso6888623a12.1
        for <linux-leds@vger.kernel.org>; Tue, 23 May 2023 10:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684862479; x=1687454479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W5S5txlWNiYeKIEfhmZSeDGPnfFSDx5ycbWVRYMu5dI=;
        b=lrP15ZPaMmvR5rJuYAASPnbjeZYvXf0yiRkQ1CYjnypEMU5zoEvMLZj19GdPCI4/Mw
         rREjfwYPpbtcDBkm/f3CycHsjt9YkV7+bxsmMn7DBiv0eYJLrZVL/HN3LcP+D2rUlDXu
         duzHtKUI9GwcyIORlYUQ/LA+xWG9QFbCmK5H4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684862479; x=1687454479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5S5txlWNiYeKIEfhmZSeDGPnfFSDx5ycbWVRYMu5dI=;
        b=GVTdNO6KdY8dX/1wtMjFBgq1d+l+doFL9Jg+xbQ0yb2J48UN7YG5MF2t69XWLT4sB6
         EmhCaSEo1XxuGUvXDsNpGHbCEHj8J4aA61sGr8uIgh4gbWCDCzO9iwNscVnBz8nbwfcV
         GoPUI6LcPZpSGr6qnUEFiZ0m6/mzzxVgfNAcyxDj6RSiEquCiAXJbBqxPJ6ruQemQi1a
         a5JscD4F2g7u49jHI1or871u6QlWbB/RVgyjM/BwWwbThGnGsKC+OO+ah3Xo8eTiv8sj
         0II9IE7mCktxONF9pkhllU9+A9CcUy9mf8VJy6VYFym8k2igEvIvrQzQTlpNd3WJ9KNA
         NTiw==
X-Gm-Message-State: AC+VfDzp0Lkrrv4dEhE10V1Mwh+/g0/NZgElx4ZnEQzjSML2/kb2+iks
        fmbdb910Jc5CGt6woceUjV7srA==
X-Google-Smtp-Source: ACHHUZ5AGolyDK1desZRPBO2wmeKuC8o8zbGl++vcoBBGTrXyygK4a5Hm6SfJkUiqsEdeZ2tdi1ABQ==
X-Received: by 2002:a17:902:dace:b0:1ae:43a8:2759 with SMTP id q14-20020a170902dace00b001ae43a82759mr15495847plx.58.1684862479082;
        Tue, 23 May 2023 10:21:19 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id iw17-20020a170903045100b001aaed524541sm7032578plb.227.2023.05.23.10.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 10:21:18 -0700 (PDT)
Date:   Tue, 23 May 2023 10:21:18 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Azeem Shaikh <azeemshaikh38@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-hardening@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: Replace all non-returning strlcpy with strscpy
Message-ID: <202305231021.DFA0C4F7D@keescook>
References: <20230523021451.2406362-1-azeemshaikh38@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230523021451.2406362-1-azeemshaikh38@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, May 23, 2023 at 02:14:51AM +0000, Azeem Shaikh wrote:
> strlcpy() reads the entire source buffer first.
> This read may exceed the destination size limit.
> This is both inefficient and can lead to linear read
> overflows if a source string is not NUL-terminated [1].
> In an effort to remove strlcpy() completely [2], replace
> strlcpy() here with strscpy().
> No return values were used, so direct replacement is safe.
> 
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
> [2] https://github.com/KSPP/linux/issues/89
> 
> Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
