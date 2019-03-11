From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 4/4] leds: lm3532: Introduce the lm3532 LED driver
Date: Mon, 11 Mar 2019 10:30:54 -0700
Message-ID: <09ee942fb7be08c600c989217ad3abfe4b6702fd.camel@perches.com>
References: <20190307220947.20057-1-dmurphy@ti.com>
         <20190307220947.20057-4-dmurphy@ti.com>
         <8ac4d84f-c792-893d-fbae-fac88fac8631@gmail.com>
         <bb621d08-c192-0018-f67e-3f3262a71b6f@ti.com>
         <cf26b351-f2b5-8345-29b7-401153b5f0d7@gmail.com>
         <ee13f836-bd77-22b0-e230-2fc9050afe88@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ee13f836-bd77-22b0-e230-2fc9050afe88@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, robh+dt@kernel.org, pavel@ucw.cz, tony@atomide.com, lee.jones@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Mon, 2019-03-11 at 12:24 -0500, Dan Murphy wrote:
> checkpatch takes issue with // in headers.
> Unless they have removed that requirement.

Awhile ago...

commit dadf680de3c2eb4cba9840619991eda0cfe98778
Author: Joe Perches <joe@perches.com>
Date:   Tue Aug 2 14:04:33 2016 -0700

    checkpatch: allow c99 style // comments
    
    Sanitise the lines that contain c99 comments so that the error doesn't
    get emitted.
    
    Link: http://lkml.kernel.org/r/d4d22c34ad7bcc1bceb52f0742f76b7a6d585235.1468368420.git.joe@perches.com
    Signed-off-by: Joe Perches <joe@perches.com>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
