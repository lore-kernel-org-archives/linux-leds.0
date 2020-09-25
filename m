Return-Path: <SRS0=X9ll=DC=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C427C4363D
	for <linux-leds@archiver.kernel.org>; Fri, 25 Sep 2020 14:28:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B61CF208A9
	for <linux-leds@archiver.kernel.org>; Fri, 25 Sep 2020 14:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601044089;
	bh=hTgo1v4nZu5+KlM9D/KXErifIu+Klvs0EbkQUCk0P7E=;
	h=Subject:To:References:Cc:From:Date:In-Reply-To:List-ID:From;
	b=AgNSOdhHlkssQYRYQlXa55s35n5AkHTqciNZdH7yW56XBm/FipLCw7YzuEGn85bBO
	 KbGBqur+e/fH0nwrPWwHshUzzMevbex73xNOeloYwJwd/0V7O+wi0JEuhniC7yu3NS
	 0Uivm9maEOpTKpfhW5d2b7x+9d1+BhXomBOsh3mE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728808AbgIYO2J (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 25 Sep 2020 10:28:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727290AbgIYO2J (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 25 Sep 2020 10:28:09 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37487C0613CE
        for <linux-leds@vger.kernel.org>; Fri, 25 Sep 2020 07:28:09 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id x14so2949558oic.9
        for <linux-leds@vger.kernel.org>; Fri, 25 Sep 2020 07:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=G8QtUwrCHJLLR9YFfvu8PbgWqFlh+WruMBeIvJCk6Qg=;
        b=QmfhfLNSjj02XYV+T3ndwMxF1Ai/GPHs+A0zqvrhuk01lBft0ASnbfK5vpwFDvUL8y
         G8h6zj+X+X93ZLwM7kYb5NSNqkj/semEN/Sgwo8jFgcQqUsGcZAVY1UulTROLWkt4BQn
         H2DAAMrFRLDgDZXQbS88fPc3lM3h3ikNzhcuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=G8QtUwrCHJLLR9YFfvu8PbgWqFlh+WruMBeIvJCk6Qg=;
        b=gEQ9H319N6qLAPnQ1rOU2Vab786mjR9+VGAPsUttT7dpLvdQ7pA39FIH4nTg7uQoAC
         uJR5ePLL33wVZkY6WyxHTrnoCJKoDJqsuZLqL4YKa34G9KCwJE+P11FfoXtpnqKNk8nM
         06ipkySsTWONcR4+kW5ny46aA8jayl2YN6v6hb5VonUt1BthoSuyeWxIN7dObjGFdVvV
         /GlNNv5N59KB7r525vwLyaiI9Ve0ux3UUuN4fO4V8VcMeOTUL7mivl+/ZVFyZ6+4vPmK
         9ZeqF+FOgClTxGEYYJV42bgMMZVxBTAosZAPQPGB47/fAPsdsrbw1iJ5sM7MJ9Y38P62
         6kNg==
X-Gm-Message-State: AOAM531UaZoj4KAfR3zl15TdYy2CdOg42ozOPj8jaKgD+c0QuxvCaOsb
        Owx2zlDIn8qOiW86o9hcAVr2mA==
X-Google-Smtp-Source: ABdhPJwaouCNx9BOs9/fDlJv4TizFGG9Wao9IuUQxYVTKbkCA1/r0DPbAu6C9FU0ikaoHC3KRni0LA==
X-Received: by 2002:a05:6808:69a:: with SMTP id k26mr385953oig.127.1601044088598;
        Fri, 25 Sep 2020 07:28:08 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id a13sm614466oib.35.2020.09.25.07.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2020 07:28:08 -0700 (PDT)
Subject: Re: [Linux-kernel-mentees] Help wanted in LED subsystem
To:     Pavel Machek <pavel@denx.de>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org
References: <20200925104739.GA26609@amd>
Cc:     Shuah Khan <skhan@linuxfoundation.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <ae09855e-79d1-a77f-289c-0a2c7d131649@linuxfoundation.org>
Date:   Fri, 25 Sep 2020 08:28:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200925104739.GA26609@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

On 9/25/20 4:47 AM, Pavel Machek wrote:
> Hi!
> 
> In linux-next, I published TODO list for LED subsystem. Is that
> something linux-kernel-mentees could help with?
> 
> Best regards,
> 							Pavel
> 

Thanks for putting this list together. Will you be able to define
some time estimates for there items? We can definitely add these
as projects to get done.

I am working on mentorship project plan for next year and we also have
an active extended mentorship program underway since June and will
continue until June 2021.

Things to consider is scope of each of these items in the TODO list
and mentor availability.

thanks,
-- Shuah
