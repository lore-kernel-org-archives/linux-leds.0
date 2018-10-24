From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v15 1/2] leds: core: Introduce LED pattern trigger
Date: Wed, 24 Oct 2018 21:17:25 +0200
Message-ID: <bdadda71-f919-b6a6-4e1c-f87ed298b6b5@gmail.com>
References: <9794969ab8a5a6f62d8ac54cdebcaa3caedfc6d6.1539230481.git.baolin.wang@linaro.org>
 <d90397dd-429f-4f3f-307c-b69dccc360e0@gmail.com> <20181024083143.GA24165@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181024083143.GA24165@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Baolin Wang <baolin.wang@linaro.org>, rteysseyre@gmail.com, bjorn.andersson@linaro.org, broonie@kernel.org, linus.walleij@linaro.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 10/24/2018 10:31 AM, Pavel Machek wrote:
> Hi!
> 
>>> +
>>> +		The gradual dimming format of the software pattern values should be:
>>> +		"brightness_1 duration_1 brightness_2 duration_2 brightness_3
>>> +		duration_3 ...". For example:
>>> +
>>> +		echo 0 1000 255 2000 > pattern
>>> +
>>> +		It will make the LED go gradually from zero-intensity to max (255)
>>> +		intensity in 1000 milliseconds, then back to zero intensity in 2000
>>> +		milliseconds:
>>> +
>>> +		LED brightness
>>> +		    ^
>>> +		255-|       / \            / \            /
>>> +		    |      /    \         /    \         /
>>> +		    |     /       \      /       \      /
>>> +		    |    /          \   /          \   /
>>> +		  0-|   /             \/             \/
>>> +		    +---0----1----2----3----4----5----6------------> time (s)
>>> +
> 
> Ok, so I got around to testing this.
> 
> echo "0 1000 10 2550 0 1000 0 100" > pattern
> 
> makes expected pattern [  .-xXx-.  ].
> 
> But when I do
> 
> echo "0 1000 10 2550 0 1000" > pattern
> 
> I only get expected pattern on the first iteration, then I get
> [    Xx-.   ].

This is because the tuples are processed in a loop, without
discerning between start and end of the sequence.

So this sequence ends up being squashed, because of the
comparison:

if (data->curr->brightness == data->next->brightness) {
	//step change od brightness
	...
	/* Skip the tuple with zero duration */

Here we actually only assume that this is zero duration since it
is not checked. Possibly needs fixing.

	pattern_trig_update_patterns(data);
	/* Select next tuple */
	pattern_trig_update_patterns(data);

In effect we have:

0 -> 10    // dimming
10 -> 0    // dimming
0 skipped  // step
10 -> 0    // dimming
0 skipped  // step
10 -> 0    // dimming
...

In order to get "rise - fall - rise - fall" sequence you need
only two tuples:

echo "0 1000 10 1000" > pattern

which will be processed as follows:

0 -> 10    // dimming
10 -> 0    // dimming
0 -> 10    // dimming
10 -> 0    // dimming
0 -> 10    // dimming
10 -> 0    // dimming

> I'm using led-controller:flash on nokia n900 (so everything in
> software).
> 
>> OK, let's abide by constant update interval for now.
>>
>> Thank you for your work on this patch set throughout
>> all these months. We will have -rc8, so one week of testing
>> before sending upstream should be enough.
>>
>> Patch set applied to the for-next branch of linux-leds.git.
> 
> Thanks!
> 									Pavel
> 

-- 
Best regards,
Jacek Anaszewski
