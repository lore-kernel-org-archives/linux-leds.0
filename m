From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v4 2/2] leds: lm3697: Introduce the lm3697 driver
Date: Fri, 17 Aug 2018 21:37:08 +0200
Message-ID: <24e05753-8ec7-e1b0-8671-8443bc20130a@gmail.com>
References: <20180816172058.31700-1-dmurphy@ti.com>
 <20180816172058.31700-2-dmurphy@ti.com>
 <9ef9cd25-5c73-964c-ac09-55c0c78e5dc9@gmail.com>
 <c751759a-d0c2-4ee7-2299-99d83538bdc4@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c751759a-d0c2-4ee7-2299-99d83538bdc4@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, robh+dt@kernel.org, pavel@ucw.cz
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Dan,

On 08/16/2018 10:44 PM, Dan Murphy wrote:
> Jacek
> 
> On 08/16/2018 02:58 PM, Jacek Anaszewski wrote:
>> Dan,
>>
>> Thank you for the patch.
>>
>> I didn't review DT parsing details in v3, but now I've produced
>> diff between v3 and v4 to check what has changed.
>>
>> I'm quite surprised realizing that you're not validating
>> HVLED and control banks assignment, having in mind earlier
>> discussions and your concerns about numerous DT configurations
>> to check.
>>
>> Is it on purpose?
>>
> 
> Yes.  It was on purpose.  After sleeping on it and going through the overall
> control to HVLED assignments I realized the user will know quite quickly
> that their configuration is messed up.
> 
> The suggestions actually simplified the code quite nicely which I am happier to have

Ack. Thanks for the v5 - I'll let it sit on the lists for a week anyway,
until the merge window gets closed.

-- 
Best regards,
Jacek Anaszewski
